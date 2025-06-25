import 'package:contact/screens/home_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = '/splashscreen';

  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
    });

    return Scaffold(
      backgroundColor: Color(0xff29384D),
      body: Center(child: Image.asset('assets/route.png')),
    );
  }
}
