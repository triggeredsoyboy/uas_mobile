import 'package:flutter/material.dart';
import 'package:uas/views/home.dart';

class Routes {
  static final Routes _instance = Routes._init();
  static Routes get instance => _instance;
  Routes._init();
  Route? onGenerateRoute(RouteSettings s) {
    var args = s.arguments;
    switch (s.name) {
      case "/home":
        return MaterialPageRoute(builder: (ctx) => const HomePage());
    }
  }
}
