import 'package:flutter/material.dart';
import 'package:http_adv/util/home_page_with_cubit.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomepageWithCubit(),
    );
  }
}
