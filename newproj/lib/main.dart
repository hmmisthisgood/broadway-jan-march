import 'package:flutter/material.dart';

import 'screens/instagram_list_screen.dart';

main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          // primaryColor: Colors.purple,
          primarySwatch: Colors.purple,
          textTheme: TextTheme()),
      home: InstagramListScreen(),
      title: "Our app",
    );
  }
}
