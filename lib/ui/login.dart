import 'package:flutter/material.dart';
import 'package:walturn_demo/custom_widgets/custom_edittext.dart';

import '../utils/app_helper.dart';
import 'package:walturn_demo/utils/api.dart' as API;

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool showLoader = false;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextField(
                  autofocus: false,
                  showCursor: true,
                  controller: emailController,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.only(left: 5, right: 5),
                    labelText: "Email",
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF222222)),
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      borderSide: BorderSide(
                        width: 3,
                        style: BorderStyle.none,
                      ),
                    ),
                    filled: false,
                    fillColor: Color(0xFFF2F3F5),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextField(
                  autofocus: false,
                  showCursor: true,
                  controller: passwordController,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.only(left: 5, right: 5),
                    labelText: "Password",
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF222222)),
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      borderSide: BorderSide(
                        width: 3,
                        style: BorderStyle.none,
                      ),
                    ),
                    filled: false,
                    fillColor: Color(0xFFF2F3F5),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                showLoader == true
                    ? const Padding(
                  padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
                  child: CircularProgressIndicator(
                      valueColor:
                      AlwaysStoppedAnimation<Color>(Colors.blueGrey)),
                )
                    : Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Color(0xFFF2F3F7)),
                  child: ElevatedButton(
                    onPressed: () async {
                      FocusScope.of(context).unfocus();
                      if (AppHelper.validateEmailAddress(
                          emailController.text) &&
                          passwordController.text.length >= 6) {
                        if (passwordController.text.trim().isNotEmpty) {
                            setState(() {
                              showLoader = true;
                            });
                            bool apiResponse =   await API.userLogin(emailController.text.toString(), passwordController.text.toString());
                            setState(() {
                              showLoader = false;
                            });
                            if(apiResponse){
                              showInSnackBar(
                                  "You're logged in successfully");
                            }else{
                              showInSnackBar(
                                  "Please enter valid credentials");
                            }
                        } else {
                          showInSnackBar(
                              "Password should contain a uppercase, a lowercase, a digit, a special character and atleast 6 characters long");
                        }
                      } else {
                        showInSnackBar(
                            "Please enter valid credentials");
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        primary: Colors.blueGrey,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: const EdgeInsets.all(17.0),
                        textStyle: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600)),
                    child: Text(
                      "Sign In",
                      //style: TextStyle(color: Colors.white,fontSize: 16,fontFamily: 'Poppins-Medium.ttf',),
                      style: Theme.of(context).textTheme.button,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }

  void showInSnackBar(String value) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(value)));
  }
}
