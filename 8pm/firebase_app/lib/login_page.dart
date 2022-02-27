import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

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
                validator: EmailValidator(errorText: "Email must be valid"),
              ),
              TextFormField(
                controller: passwordController,
                decoration: InputDecoration(labelText: "Password"),
              ),
              MaterialButton(
                onPressed: () {
                  bool isValidated = formKey.currentState!.validate();
                  if (isValidated) {
                    loginCubit.login(
                        email: emailController.text,
                        password: passwordController.text);
                  }
                },
                child: Text("Login"),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(
                        color: Colors.grey,
                      )),
                  onPressed: () {
                    loginCubit.signInWithGoogle();
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(children: [
                      Image.asset("assets/google.png", height: 30, width: 30),
                      SizedBox(width: 20),
                      Text("Sign in with google",
                          style: TextStyle(fontWeight: FontWeight.bold))
                    ]),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(
                        color: Colors.grey,
                      )),
                  onPressed: () {
                    loginCubit.signInWithFacebook();
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(children: [
                      Image.asset("assets/google.png", height: 30, width: 30),
                      SizedBox(width: 20),
                      Text("Sign in with facebook",
                          style: TextStyle(fontWeight: FontWeight.bold))
                    ]),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// IgnorePointer 