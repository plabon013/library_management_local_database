// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:library_manager/auth_pref.dart';
import 'package:library_manager/pages/login_page.dart'; 
import 'package:library_manager/widgets/bottom_nav_bar.dart'; 

class Launcher_page extends StatefulWidget {
  static const routeName = "launcher-page";
  const Launcher_page({Key? key}) : super(key: key);

  @override
  State<Launcher_page> createState() => _Launcher_pageState();
}

class _Launcher_pageState extends State<Launcher_page> {
  @override
  void initState() { 

     getLogInStatus().then((value) {
      if(value){
        Navigator.pushReplacementNamed(context, BottomNavBar.routeName);
      }else{
        Navigator.pushReplacementNamed(context, LoginPage.routeName);
      }
     });

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:   CircularProgressIndicator(),
      ),
    );
  }
}