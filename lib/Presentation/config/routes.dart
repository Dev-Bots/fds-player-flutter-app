
import 'package:dev_player_fds/Presentation/screens/screens.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static const String loginPage = "/login";
  static const String homePage = "/"; //default page
  static const String registerPage = "/register";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case loginPage:
        return MaterialPageRoute(builder: (_) => const LoginPage());
      case homePage:
        return MaterialPageRoute(builder: (_) => HomePage());
      case registerPage:
        return MaterialPageRoute(builder: (_) => const RegisterPage());
      default:
        throw const FormatException("Route was not found");
    }
  }
}
// If we need to pass argument to the next screen, we can use the below
// We can create a Route<dynamic> classed error handler like in Flutter Routes & Navigation – Parameters, Named Routes, onGenerateRoute video on Reso Coder


  // static Route<dynamic> generateRouteWithArgs(RouteSettings settings) {
  //   switch (settings.name) {
  //     case loginPage:
  //       return MaterialPageRoute(
  //           builder: (_) => const LoginPage(
  //                 user: settings.arguments,
  //               ));
  //     case homePage:
  //       return MaterialPageRoute(
  //           builder: (_) => const HomePage(
  //                 user: settings.arguments,
  //               ));
  //     case registerPage:
  //       return MaterialPageRoute(
  //           builder: (_) => const RegisterPage(
  //                 user: settings.arguments,
  //               ));
  //     default:
  //       throw const FormatException("Route was not found");
  //   }
  // }