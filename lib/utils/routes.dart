import 'package:flutter/material.dart';

class AppRoutes {
  static const screen1 = '1';
  static const screen2 = '2';
  static const screen3 = '3';
  static const screen4 = '4';
  static const screen5 = '5';
  static const screen6 = '6';
  static const screen7 = '7';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      // case login:
      //   return MaterialPageRoute(
      //       builder: (_) => const LoginScreen(), settings: settings);
      // case home:
      //   return MaterialPageRoute(
      //       builder: (_) => const HomeScreen(), settings: settings);
      // case detail:
      //   return MaterialPageRoute(
      //       builder: (_) => const DetailScreen(), settings: settings);
      // case map:
      //   return MaterialPageRoute(
      //       builder: (_) => const MapScreen(), settings: settings);
      // case cart:
      //   return MaterialPageRoute(
      //       builder: (_) => const CartScreen(), settings: settings);
      default:
        throw UnimplementedError("no route exists for ${settings.name}");
    }
  }
}
