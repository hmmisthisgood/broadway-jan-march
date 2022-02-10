import 'package:flutter/material.dart';
import 'package:newproj/navigation/routes.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
//  widgets for form are TextField and TextFormField

  final emailController = new TextEditingController();
  final passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  bool hidePassword = true;
  @override
  void dispose() {
    super.dispose();

    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          // autovalidateMode: AutovalidateMode.always,
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // Container(height: 400, color: Colors.green),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  // autofocus: true,
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.send,
                  style: TextStyle(
                      // color: Colors.purple,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                  decoration: InputDecoration(
                    hintText: "Enter your email: a@b.com",
                    // labelText: "Email",
                    hintStyle: TextStyle(color: Colors.grey, fontSize: 12),
                    label: Text("Email"),
                    labelStyle: TextStyle(color: Colors.green),
                    // border: OutlineInputBorder(
                    //   borderRadius: BorderRadius.circular(10),
                    //   borderSide: BorderSide(color: Color(0xff0B69FA)),
                    // ),
                    // border: InputBorder.none,
                    // prefixIcon: Icon(Icons.email),
                    // suffixIcon: Icon(Icons.send),
                    filled: true,
                    // fillColor: Colors.pink,
                    // border: InputBorder.none
                    // border: OutlineInputBorder(
                    //   borderRadius: BorderRadius.circular(10),
                    //   borderSide: BorderSide(color: Color(0xff0B69FA)),
                    // ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Color(0xff0B69FA)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Color(0xff0B69FA)),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.red),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.red),
                    ),
                    // border: UnderlineInputBorder(borderSide: )
                  ),
                  onChanged: (val) {
                    print(val);
                  },
                  onFieldSubmitted: (val) {
                    print("submiteed: $val");
                  },
                  validator: (val) {
                    if (val != null && val.isNotEmpty) {
                      return null;
                    }

                    return "Email must not be empty";
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: passwordController,
                  obscureText: hidePassword,
                  validator: (val) {
                    if (val == null) {
                      return "Password must not be empty";
                    }
                    if (val.length < 5) {
                      return "Password must be longer than 5 characters";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    label: Text("Password"),
                    suffixIcon: InkWell(
                      onTap: () {
                        hidePassword = !hidePassword;
                        setState(() {});
                      },
                      child: Icon(
                        hidePassword == true
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                    ),
                    // border: InputBorder.none
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Color(0xff0B69FA)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Color(0xff0B69FA)),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.red),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.red),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text("Frogot Password?"),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                MaterialButton(
                  color: Color(0xff0B69FA),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  minWidth: 200,
                  onPressed: () {
                    // emailController.text;

                    if (formKey.currentState != null) {
                      formKey.currentState!.save();
                      bool isValidated = formKey.currentState!.validate();

                      if (isValidated) {
                        Navigator.pushNamed(context, Routes.homeRoute);
                      }
                    }
                  },
                  child: Text(
                    "Log In",
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
