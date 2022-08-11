

import 'package:shared_preferences/shared_preferences.dart';

Future<bool> setLogInStatus(bool ststus) async{
  final pref = await SharedPreferences.getInstance();
  return pref.setBool("isLoggedIn", ststus);
}

Future<bool> getLogInStatus() async{
  final pref = await SharedPreferences.getInstance();
  return pref.getBool("isLoggedIn") ??  false;
}