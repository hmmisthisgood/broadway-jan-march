import 'package:flutter/material.dart';

import 'bloc/register_cubit.dart';
import 'login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  RegisterCubit _registerCubit = RegisterCubit();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(labelText: "Email"),
              ),
              TextFormField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(labelText: "Password"),
              ),
              MaterialButton(
                color: Colors.green,
                onPressed: () {
                  _registerCubit.register(
                      email: emailController.text,
                      password: passwordController.text);
                },
                child: Text("Register"),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => LoginPage()));
                },
                child: Text("Already signed In? Sign In"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
