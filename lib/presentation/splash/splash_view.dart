import 'dart:async';
import 'package:flutter/material.dart';
import 'package:tut_app/utils/assets_manger.dart';
import 'package:tut_app/utils/color_manger.dart';
import 'package:tut_app/utils/constants_manger.dart';
import 'package:tut_app/utils/routes_manager.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  Timer? _timer;

  _startDelay() {
    _timer = Timer(const Duration(seconds: AppConstants.splashDelay), _goNext);
  }

  _goNext() {
    Navigator.pushReplacementNamed(context, Routes.onBoardingRoute);
  }

  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManger.primaryColor,
      body: Center(child: Image(image: AssetImage(ImageAssets.splashlogo))),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
