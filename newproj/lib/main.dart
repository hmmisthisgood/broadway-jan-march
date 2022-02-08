import 'package:flutter/material.dart';
import 'package:newproj/screens/tik_tok_screen.dart';

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
      home: TikTokScreen(),
      title: "Our app",
    );
  }
}
