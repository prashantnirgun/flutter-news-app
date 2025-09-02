import 'dart:async';

import 'package:flutter/material.dart';
import 'package:news_app/constants/app_constants.dart';
import 'package:news_app/presentation/screens/dashboard_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 1), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => DashboardPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Image.asset(
            'assets/images/splash.png',
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              margin: EdgeInsets.only(top: 50),
              child: Text(
                AppConstants.APPNAME,
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.only(bottom: 100),
              child: Text(
                'Don\'t Miss What Happen In\nAnother Part of The World',
                style: TextStyle(color: Colors.white, fontSize: 22),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.only(bottom: 20),
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 21),
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(backgroundColor: Colors.blue),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => DashboardPage()),
                  );
                },
                child: Text(
                  'Get Started',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
