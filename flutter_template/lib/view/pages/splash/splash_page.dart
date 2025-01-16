import 'package:flutter/material.dart';
import 'package:sample_project/view/pages/splash/splash_controller.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with SplashController {

  @override
  void initState() {
    init();
    super.initState();
  }


  @override
  Widget build(final BuildContext context) => const Placeholder();
}
