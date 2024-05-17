import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

// import 'package:hive/hive.dart';
// import 'package:shared_preferences/shared_preferences.dart';

GetStorage storage = GetStorage();

class GetStorageSplash extends StatefulWidget {
  const GetStorageSplash({super.key});

  @override
  State<GetStorageSplash> createState() => _GetStorageSplashState();
}

class _GetStorageSplashState extends State<GetStorageSplash> {
  @override
  void initState() {
    Future.delayed(
      Duration(milliseconds: 2000),
      () async {
        // final SharedPreferences prefs = await SharedPreferences.getInstance();
        // bool hasLoggedIn = prefs.getBool("hasLoggedIn") ?? false;

        // var box = await Hive.openBox('myBox');
        // bool hasLoggedIn = box.get("hasLoggedIn") ?? false;
        bool hasLoggedIn = storage.read("hasLoggedIn") ?? false;
        if (hasLoggedIn)
          return Navigator.push(
            context,
            MaterialPageRoute(builder: (BuildContext context) => GetStorageMainPage()),
          );
        else
          return Navigator.push(
            context,
            MaterialPageRoute(builder: (BuildContext context) => GetStorageLoginPage()),
          );
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Get Storage Splash"),
      ),
    );
  }
}

class GetStorageMainPage extends StatefulWidget {
  const GetStorageMainPage({super.key});

  @override
  State<GetStorageMainPage> createState() => _GetStorageMainPageState();
}

class _GetStorageMainPageState extends State<GetStorageMainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Get Storage Main"),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              // final SharedPreferences prefs = await SharedPreferences.getInstance();
              // prefs.clear();

              // var box = await Hive.openBox('myBox');
              // box.clear();

              storage.remove("hasLoggedIn");
              Navigator.push(
                context,
                MaterialPageRoute(builder: (BuildContext context) => GetStorageSplash()),
              );
            },
            child: Text("Logout"),
          ),
        ],
      ),
    );
  }
}

class GetStorageLoginPage extends StatefulWidget {
  const GetStorageLoginPage({super.key});

  @override
  State<GetStorageLoginPage> createState() => _GetStorageLoginPageState();
}

class _GetStorageLoginPageState extends State<GetStorageLoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Get Storage Login"),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () async {
              // final SharedPreferences prefs = await SharedPreferences.getInstance();
              // prefs.setBool("hasLoggedIn", true);

              // var box = await Hive.openBox('myBox');
              // box.put("hasLoggedIn", true);

              storage.write("hasLoggedIn", true);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (BuildContext context) => GetStorageMainPage()),
              );
            },
            child: Text("Login"),
          ),
        ],
      ),
    );
  }
}
