import 'dart:async';

import 'package:flutter/material.dart';
import 'package:islamii_app/config/settings_provider.dart';
import 'package:islamii_app/layout/layout_view.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static const route_name = "/";

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, LayoutScreen.route_name);
    });
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    var vm = Provider.of<SettingProvider>(context);
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(vm.current_theme == ThemeMode.light
                  ? 'assets/images/splash.png'
                  : "assets/images/splash _dark.png"),
              fit: BoxFit.cover)),
    );
  }
}
