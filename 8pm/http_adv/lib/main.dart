import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http_adv/bloc/photos_bloc.dart';
import 'package:http_adv/home_page_with_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PhotosCubit(),
      child: MaterialApp(
        theme: ThemeData(primarySwatch: Colors.pink),
        home: HomepageWithCubit(
          title: "press me",
        ),
      ),
    );
  }
}
