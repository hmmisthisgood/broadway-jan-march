import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:newproj/navigation/routes.dart';
import 'package:newproj/util/shared_pref.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    checkUsersLoggedInSatus();
  }

  checkUsersLoggedInSatus() async {
    final isLoggedIn = await SharedPref.getUserLoggedInStatus();

    await Future.delayed(Duration(milliseconds: 1500), () {
      if (isLoggedIn) {
        Navigator.pushReplacementNamed(context, Routes.homeRoute);
      } else {
        Navigator.pushReplacementNamed(context, Routes.loginRoute);

        // Navigator.pushReplacementNamed(context, newRoute);

      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child:
              SvgPicture.asset("assets/icons/ig.svg", height: 100, width: 100)

          /// default asset image implmentation
          // Image.asset("assets/icons/ig.png", height: 100, width: 100),
          ),
    );
  }
}
