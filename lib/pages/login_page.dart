// ignore_for_file: prefer_const_constructors

import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:library_manager/auth_pref.dart';
import 'package:library_manager/pages/home_page.dart';
import 'package:library_manager/pages/sign_up_page.dart';
import 'package:library_manager/widgets/bottom_nav_bar.dart';
import 'package:provider/provider.dart';

import '../models/admin_db_model.dart';
import '../providers/library_provider.dart';

class LoginPage extends StatefulWidget {
  static const routeName = 'login-screen';
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();



  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
            key: formKey,
            child: ListView(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                        color: Colors.purple,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(100))),
                  ),
                ),
                Text(
                  "Admin Login",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                      wordSpacing: 2,
                      fontStyle: FontStyle.italic),
                ),
                SizedBox(
                  height: 20,
                ),
                Image.asset(
                  "assets/images/login.png",
                  height: 220,
                  width: 220,
                  fit: BoxFit.fitHeight,
                ),
                SizedBox(
                  height: 20,
                ),

                // todo This is email textField section
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: emailController,
                    style: TextStyle(
                        color: Colors.purple, fontWeight: FontWeight.w500),
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xffe6e6e6),
                        contentPadding: EdgeInsets.only(left: 10),
                        focusColor: Colors.white,
                        prefixIcon: Icon(
                          Icons.email,
                        ),
                        hintText: "Enter your email",
                        hintStyle: TextStyle(
                            color: Colors.grey, fontWeight: FontWeight.normal),
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(20))),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'This field must not be empty';
                      }
                       else {
                        return null;
                      }
                    },
                  ),
                ),

                // todo this is password textField section
                Padding(
                  padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
                  child: TextFormField(
                    obscureText: _isObscure,
                    controller: passwordController,
                    style: TextStyle(
                        color: Colors.purple, fontWeight: FontWeight.w500),
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xffe6e6e6),
                        contentPadding: EdgeInsets.only(left: 10),
                        focusColor: Colors.white,
                        prefixIcon: Icon(
                          Icons.lock,
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _isObscure
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                          onPressed: () {
                            setState(() {
                              _isObscure = !_isObscure;
                            });
                          },
                        ),
                        hintText: "Enter your password",
                        hintStyle: TextStyle(
                            color: Colors.grey, fontWeight: FontWeight.normal),
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(20))),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'This field must not be empty';
                      }
                      if (value.length < 8) {
                        return 'password must be in 8 character';
                      } else {
                        return null;
                      }
                    },
                  ),
                ),

                Align(
                    alignment: Alignment.topRight,
                    child: TextButton(
                        onPressed: () {},
                        child: Text(
                          "forget password?",
                        ))),

                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 80, vertical: 20),
                  child: ElevatedButton(
                      onPressed: _chechValidet,
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)))),
                      child: Text(
                        "LogIn",
                        style: TextStyle(fontSize: 16),
                      )),
                ),

                RichText(
                  textAlign: TextAlign.center,
            text: TextSpan(children: [
              TextSpan(
                text: 'You have no account? ',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              TextSpan(
              text: ' Sign UP',
              style: TextStyle(color: Colors.purple, fontWeight: FontWeight.w500),
              
              recognizer: TapGestureRecognizer()
                ..onTap = () { 

                  Navigator.pushNamed(context, SignUpPage.routeName);

                }),
            ]),
          ),
              ],
            )),
      ),
    );
  }

void _chechValidet() async{
    if (formKey.currentState!.validate()) {
    final model = await Provider.of<LibraryProvider>(context, listen: false)
          .getValidAdmin(emailController.text);



      if (model.adminPassword == passwordController.text) {
        setLogInStatus(true);
         Navigator.pushReplacementNamed(context, BottomNavBar.routeName);
      }

      
    }
  }
}
