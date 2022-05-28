import 'package:dev_player_fds/Presentation/screens/screens.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static const String loginPage = "/login";
  static const String splashPage = "/";
  static const String homePage = "/home"; //default page
  static const String registerPage = "/register";
  static const String detailsPage = "/details";
  static const String attendedPage = "/attended";
  static const String profilePage = "/profile";
  static const String editProfilePage = "/editProfile";
  static const String errorRoute = "/event";

  // static const String testFrontPage = "/test";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case loginPage:
        return MaterialPageRoute(builder: (_) => LoginPage());

      case homePage:
        return MaterialPageRoute(builder: (_) => HomePage());

      case splashPage:
        return MaterialPageRoute(builder: (_) => SplashPage());

      case profilePage:
        return MaterialPageRoute(builder: (_) => ProfilePage());

      case registerPage:
        return MaterialPageRoute(builder: (_) => RegisterPage());

      // case registerPage:
      //   return MaterialPageRoute(builder: (_) => const RegisterPage());

      case detailsPage:
        return MaterialPageRoute(
            builder: (_) => EventDetails(
                  eventId: settings.arguments as int,
                ));

      case attendedPage:
        return MaterialPageRoute(builder: (_) => AttendedEventsPage());

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
