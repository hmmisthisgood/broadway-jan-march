import 'package:flutter/material.dart';

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
        padding: const EdgeInsets.all(8.0),
        child: Form(
          // autovalidateMode: AutovalidateMode.always,
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                // autofocus: true,
                controller: emailController,
                decoration: InputDecoration(
                  hintText: "Enter your email: a@b.com",
                  // labelText: "Email",
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 12),
                  // border: OutlineInputBorder(
                  //   borderRadius: BorderRadius.circular(10),
                  //   borderSide: BorderSide(color: Color(0xff0B69FA)),
                  // ),
                  // border: InputBorder.none,

                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.red),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Color(0xff0B69FA)),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Color(0xff0B69FA)),
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
              SizedBox(height: 10),
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
                )),
              ),
              MaterialButton(
                color: Color(0xff0B69FA),
                onPressed: () {
                  if (formKey.currentState != null) {
                    formKey.currentState!.save();
                    formKey.currentState!.validate();
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
    );
  }
}
