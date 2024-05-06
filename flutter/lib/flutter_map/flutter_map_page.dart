import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class FlutterMapPage extends StatefulWidget {
  const FlutterMapPage({super.key});

  @override
  State<FlutterMapPage> createState() => _FlutterMapPageState();
}

class _FlutterMapPageState extends State<FlutterMapPage> {
  final MapController mapController = MapController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FlutterMap(
            mapController: mapController,
            options: MapOptions(
                initialCenter: LatLng(35.592781, 51.351981),
                initialZoom: 5,
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
          ElevatedButton(
            onPressed: () {
              print("شمال غرب");
              print(mapController.camera.visibleBounds.northWest);
              print("شمال شرق");
              print(mapController.camera.visibleBounds.northEast);
              print("جنوب غرب");
              print(mapController.camera.visibleBounds.southWest);
              print("جنوب شرق");
              print(mapController.camera.visibleBounds.southEast);
            },
            child: Text("Get Bounds"),
          ),
        ],
      ),
    );
  }
}
