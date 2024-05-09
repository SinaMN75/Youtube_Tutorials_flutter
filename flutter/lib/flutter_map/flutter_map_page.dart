import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';

class FlutterMapPage extends StatefulWidget {
  const FlutterMapPage({super.key});

  @override
  State<FlutterMapPage> createState() => _FlutterMapPageState();
}

class _FlutterMapPageState extends State<FlutterMapPage> {
  final MapController mapController = MapController();
  LocationData? _locationData;

  void getUserLocation() async {
    Location location = new Location();
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _locationData = await location.getLocation();

    location.changeSettings(accuracy: LocationAccuracy.high);
    location.enableBackgroundMode(enable: true);
    location.onLocationChanged.listen((LocationData event) {
      setState(() {
        _locationData = event;
      });
    });

    setState(() {});
    print("User Location");
    print(_locationData?.latitude ?? 0);
    print(_locationData?.longitude ?? 0);
  }

  @override
  void initState() {
    getUserLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FlutterMap(
            mapController: mapController,
            options: MapOptions(
                minZoom: 2,
                onPointerUp: (PointerUpEvent event, LatLng point) {
                  print("شمال غرب");
                  print(mapController.camera.visibleBounds.northWest);
                  print("شمال شرق");
                  print(mapController.camera.visibleBounds.northEast);
                  print("جنوب غرب");
                  print(mapController.camera.visibleBounds.southWest);
                  print("جنوب شرق");
                  print(mapController.camera.visibleBounds.southEast);
                  print("مرکز");
                  print(mapController.camera.visibleBounds.center);
                },
                initialCenter: LatLng(35.592781, 51.351981),
                initialZoom: 2,
                onTap: (TapPosition tapPosition, LatLng latlng) {
                  print(latlng);
                  mapController.move(latlng, 10);
                }),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'com.example.app',
              ),
              MarkerLayer(
                markers: [
                  Marker(
                    point: LatLng(35, 55),
                    child: IconButton(
                      icon: Icon(Icons.ac_unit),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text("Sample Location"),
                            );
                          },
                        );
                      },
                    ),
                  ),
                  Marker(point: LatLng(36, 55), child: FlutterLogo()),
                  Marker(point: LatLng(40, 55), child: FlutterLogo()),
                  Marker(point: LatLng(35, 56), child: FlutterLogo()),
                  Marker(
                    point: LatLng(_locationData?.latitude ?? 0, _locationData?.longitude ?? 0),
                    child: Icon(Icons.my_location, size: 40, color: Colors.blue),
                  ),
                ],
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  FloatingActionButton(
                    child: Icon(Icons.add),
                    onPressed: () {
                      mapController.move(
                        mapController.camera.center,
                        mapController.camera.zoom + 1,
                      );
                    },
                  ),
                  SizedBox(height: 12),
                  FloatingActionButton(
                    child: Icon(Icons.remove),
                    onPressed: () {
                      mapController.move(
                        mapController.camera.center,
                        mapController.camera.zoom - 1,
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: EdgeInsets.all(20),
              child: FloatingActionButton(
                child: Icon(Icons.my_location),
                onPressed: () {
                  mapController.move(
                    LatLng(_locationData?.latitude ?? 0, _locationData?.longitude ?? 0),
                    12,
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
