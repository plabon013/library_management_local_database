// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:library_manager/pages/launcher_page.dart'; 

class SplashScreen extends StatefulWidget {
  static const routeName = "/";
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
    @override  
  void initState() {  
    super.initState();  
    Timer(Duration(seconds: 3),  
            ()=>Navigator.pushReplacementNamed(context, Launcher_page.routeName) 
    );  
  } 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,

      body: Center(child: Image.asset('assets/images/logo.png', height: 200,fit: BoxFit.fitHeight,))
      
    );
  }
}