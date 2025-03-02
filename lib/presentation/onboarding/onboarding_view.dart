import 'package:flutter/material.dart';
import 'package:tut_app/utils/color_manger.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManger.darkGrey,
      body: Center(child: Text('Onboarding View')),
    );
  }
}
