import 'dart:io';

import 'package:appcheck/appcheck.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:safe_device/safe_device.dart';
import 'package:screen_protector/screen_protector.dart';

class SafeDevicePage extends StatefulWidget {
  const SafeDevicePage({super.key});

  @override
  State<SafeDevicePage> createState() => _SafeDevicePageState();
}

class _SafeDevicePageState extends State<SafeDevicePage> {
  @override
  void initState() {
    checkSafeDevice();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Safe Device")),
    );
  }

  Future<void> checkSafeDevice() async {
    ScreenProtector.preventScreenshotOn();
    ScreenProtector.protectDataLeakageOn();
    ScreenProtector.protectDataLeakageWithColor(Colors.red);

    final List<AppInfo>? installedApps = await AppCheck.getInstalledApps();
    installedApps?.forEach((final AppInfo i) {
      if (i.appName?.toLowerCase() == "frida" ||
          i.appName?.toLowerCase() == "xposed" ||
          i.appName?.toLowerCase() == "dropper" ||
          i.appName?.toLowerCase() == "drozer" ||
          i.appName?.toLowerCase() == "rootcloak" ||
          i.appName?.toLowerCase() == "Httpcanary" ||
          i.packageName.toLowerCase() == "com.manipardaz.pna" ||
          i.packageName.toLowerCase() == "com.mwr.dz" ||
          i.packageName.toLowerCase() == "com.devadvance.rootcloak2" ||
          i.packageName.toLowerCase() == "com.lbe.parallel.intl" ||
          i.packageName.toLowerCase() == "de.robv.android.xposed.installer" ||
          i.packageName.toLowerCase() == "com.manipardaz.pna") {
        exit(0);
      }
    });
    if (!await SafeDevice.isSafeDevice && !kDebugMode) exit(0);
  }
}
