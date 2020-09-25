import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:searching_algorithm_visualizer/screens/home_screen.dart';

class LoadingScreen extends StatefulWidget {
  static const nameRoute = 'welcome';

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), (){
      loadHomeScreen();
    });
  }

  void loadHomeScreen() {
    Navigator.pushNamed(context, HomeScreen.nameRoute);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}
