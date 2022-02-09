import 'package:flutter/material.dart';

import 'navigation/route_generator.dart';
import 'navigation/routes.dart';

main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.purple, textTheme: TextTheme()),
      // home: TikTokScreen(),
      title: "Our app",

      // It is same as below, only in differnt syntax
      // onGenerateRoute: (settings) {
      //   customRouteGenerator(settings);
      // },
      onGenerateRoute: customRouteGenerator,
      initialRoute: Routes.profileRoute,
    );
  }
}
