import 'package:flutter/material.dart';
import 'package:flutter_car/pages/onboarding_screen.dart';
import 'package:flutter_car/pages/selection_page.dart';
import 'package:flutter_car/pages/get_started_page.dart';
import 'package:flutter_car/utils/methods.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) => goToNextPageRemoveHistory(context, OnBoardingPage()));

  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
