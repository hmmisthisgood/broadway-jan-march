import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:newproj/navigation/routes.dart';
import 'package:newproj/util/shared_pref.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as api;
import 'package:fluttertoast/fluttertoast.dart';

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

// Authentication : precess of identifying the user and finding out if it exists.

// Authorization : checks the access to the resources

  postLogin() async {
    SharedPref.setUserLoggedInStatus(true);

    final url = "https://github.com/logineawgwe";

    // Uri = all kinds of path no matter what. // file:///home/manish/Pictures/aws-container.png

    // Url  is a subset of Uri. url is mostly a web url

    final Map requestBody = {
      "email": emailController.text,
      "password": passwordController.text
    };

    // final httpResponse = await api.post(Uri.parse(url), body: requestBody);
    try {
      final dioResponse = await Dio().post(url, data: requestBody);

      /// once login is successful , save user's login stataus in permanent storage
      SharedPref.setUserLoggedInStatus(true);
      Navigator.pushNamed(context, Routes.homeRoute);
    } catch (e) {
      print(e.toString());
      showErrorDialog();
      // Fluttertoast.showToast(
      //     msg: "An error occurred while logging you in",
      //     gravity: ToastGravity.SNACKBAR,
      //     backgroundColor: Colors.red);
    }

    print("the error has been caught");
  }

  showErrorDialog() {
    showDialog(
        context: context,
        // barrierDismissible: false,
        builder: (context) {
          return Dialog(
              child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Container(
              ///  we can provider custom height and width to the dailog
              ///  by wrapping it with container
              // height: 500,
              // width: 100,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.error_outline,
                    size: 40,
                    color: Colors.red,
                  ),
                  SizedBox(height: 20),
                  Text("An error occurred while loggin in ",
                      style: TextStyle(fontSize: 16))
                ],
              ),
            ),
          ));
        });
    // showErrorDialog();
  }

  fetchPosts() async {
    final postData = await Dio().get("",
        options: Options(
          headers: {"Authorization": "Beater eyaw.... token"},
        ));

    final httpPostData = await api
        .get(Uri.parse(""), headers: {"Authorization": "Bearer ey..."});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
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
                    validator: EmailValidator(errorText: "Email must be valid"),
                    // validator: (val) {
                    //   if (val != null && val.isNotEmpty) {
                    //     return null;
                    //   }

                    //   return "Email must not be empty";
                    // },
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: passwordController,
                    obscureText: hidePassword,
                    validator: (val) {
                      if (val == null) {
                        return "Password must not be empty";
                      }
                      if (val.length < 8) {
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
                    onPressed: () async {
                      // emailController.text;

                      if (formKey.currentState != null) {
                        formKey.currentState!.save();
                        bool isValidated = formKey.currentState!.validate();

                        if (isValidated) {
                          postLogin();
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
      ),
    );
  }
}
