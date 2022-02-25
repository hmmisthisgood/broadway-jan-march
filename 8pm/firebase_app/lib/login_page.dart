import 'package:flutter/material.dart';

import 'bloc/login_cubit.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  final loginCubit = LoginCubit();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: "Email"),
                controller: emailController,
              ),
              TextFormField(
                controller: passwordController,
                decoration: InputDecoration(labelText: "Password"),
              ),
              MaterialButton(
                onPressed: () {
                  loginCubit.login(
                      email: emailController.text,
                      password: passwordController.text);
                },
                child: Text("Login"),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// IgnorePointer 