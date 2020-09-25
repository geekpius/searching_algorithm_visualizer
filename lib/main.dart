import 'package:flutter/material.dart';
import 'package:searching_algorithm_visualizer/route_generator.dart';
import 'package:searching_algorithm_visualizer/screens/loading_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.deepOrangeAccent,
        scaffoldBackgroundColor: Colors.white
      ),
      initialRoute: LoadingScreen.nameRoute,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
