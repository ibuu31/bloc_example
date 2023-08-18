import 'package:bloc_example/presentation/home_screen.dart';
import 'package:bloc_example/presentation/second_screen.dart';
import 'package:bloc_example/presentation/third_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (context) => HomePage(),
        );
      case '/second':
        return MaterialPageRoute(builder: (_) => SecondScreen());
      case '/third':
        return MaterialPageRoute(builder: (_) => ThirdScreen());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child:
                          Text('No route defined for ${routeSettings.name}')),
                ));
    }
  }
}
