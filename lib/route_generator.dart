import 'package:flutter/material.dart';
import 'package:searching_algorithm_visualizer/screens/home_screen.dart';
import 'package:searching_algorithm_visualizer/screens/loading_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
//    final args = settings.arguments;

    switch (settings.name) {
      case LoadingScreen.nameRoute:
        return MaterialPageRoute(builder: (context) => LoadingScreen());

      case HomeScreen.nameRoute:
        return MaterialPageRoute(builder: (context) => HomeScreen());
//      case 'location':
//        return MaterialPageRoute(
//          builder: (context) => LocationScreen(
//            weatherData: args,
//          ),
//        );
//      case 'city':
//        return MaterialPageRoute(builder: (context) => CityScreen());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('ERROR'),
          centerTitle: true,
        ),
        body: Center(
          child: Text('Page not found!'),
        ),
      );
    });
  }
}
