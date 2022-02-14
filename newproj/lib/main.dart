import 'package:flutter/material.dart';
import 'package:newproj/screens/login_screen.dart';
import 'package:newproj/screens/tik_tok_screen.dart';
import 'package:newproj/util/shared_pref.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'navigation/route_generator.dart';
import 'navigation/routes.dart';

main() {
  runApp(App());
}

class App extends StatelessWidget {
  Future<bool> getHasUserLoggedIn() async {
    bool isLoggedIn = await SharedPref.getUserLoggedInStatus();
    print("Has user logged In: $isLoggedIn");
    return isLoggedIn;
  }

  final loggedIn = false;
  @override
  Widget build(BuildContext context) {
    // return FutureBuilder<bool>(
    //   future: getHasUserLoggedIn(),
    //   builder: (context, loggedInValue) {
    //     if (loggedInValue.connectionState == ConnectionState.done) {
    //       return MaterialApp(
    //         theme:
    //             ThemeData(primarySwatch: Colors.purple, textTheme: TextTheme()),
    //         title: "Our app",
    //         onGenerateRoute: customRouteGenerator,
    //         home: loggedInValue.data == true ? TikTokScreen() : LoginScreen(),
    //       );
    //     }
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.purple, textTheme: TextTheme()),
      title: "Our app",
      onGenerateRoute: customRouteGenerator,
      initialRoute: Routes.index,
    );
    // },
    // );
  }
}
