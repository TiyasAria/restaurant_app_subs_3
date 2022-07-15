import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:reaturant_app/common/theme.dart';
import 'package:reaturant_app/ui/home_screen.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  static String routeName = '/splashScreen' ;


  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    splashScreen();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset('asset/31979-fast-food.json',
            repeat: true,
              reverse: true,
              animate: true
            ),
            Text('Restaurant App', style: titleText)
          ],
        ),
      ),
    );
  }
  splashScreen() async{
    var duration = const Duration(seconds: 7);
    return Timer(duration, (){
      Navigator.pushReplacementNamed(context, HomeScreen.routeName);
    });
  }
}


