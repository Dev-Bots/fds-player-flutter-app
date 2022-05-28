import 'dart:ffi';

import 'package:shared_preferences/shared_preferences.dart';

Future checkrole() async {
  final prefs = await SharedPreferences.getInstance();
  final role = prefs.getString('user');
  print(role);
  return true;
  // if (role == 'admin') {
  //   return true;
  // } else {
  //   return false;
  // }
}
