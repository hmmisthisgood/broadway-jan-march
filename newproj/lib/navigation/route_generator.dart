import 'package:flutter/material.dart';
import 'package:newproj/screens/login_screen.dart';
import 'package:newproj/screens/profile_screen.dart';
import 'package:newproj/screens/splash_screen.dart';
import 'package:newproj/screens/tik_tok_screen.dart';

import 'routes.dart';

Route customRouteGenerator(RouteSettings settings) {
  switch (settings.name) {
    case Routes.index:
      return MaterialPageRoute(builder: (context) => SplashScreen());

    case Routes.profileRoute:
      return MaterialPageRoute(builder: (context) => ProfieScreen());
    case Routes.loginRoute:
      return MaterialPageRoute(builder: (context) => LoginScreen());

    case Routes.homeRoute:
      return MaterialPageRoute(builder: (context) => TikTokScreen());

    case Routes.settingsRoute:
      return MaterialPageRoute(builder: (context) => ProfieScreen());

    default:
      return MaterialPageRoute(builder: (context) => SplashScreen());
  }
}
