import 'package:flutter/material.dart';
import 'package:newproj/screens/profile_screen.dart';

import 'routes.dart';

Route customRouteGenerator(RouteSettings settings) {
  switch (settings.name) {
    case Routes.profileRoute:
      return MaterialPageRoute(builder: (context) => ProfieScreen());
    case Routes.loginRoute:
      return MaterialPageRoute(builder: (context) => ProfieScreen());

    case Routes.homeRoute:
      return MaterialPageRoute(builder: (context) => ProfieScreen());

    case Routes.settingsRoute:
      return MaterialPageRoute(builder: (context) => ProfieScreen());

    default:
      return MaterialPageRoute(builder: (context) => Container());
  }
}
