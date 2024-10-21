import 'package:flutter/material.dart';
import 'package:y_mart/pages/cart.dart';
import 'package:y_mart/pages/forgotpassword.dart';
import 'package:y_mart/pages/home.dart';
import 'package:y_mart/pages/homescreen.dart';
import 'package:y_mart/pages/login.dart';
import 'package:y_mart/pages/profile.dart';
import 'package:y_mart/pages/signup.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: 'Poppins'),
        home: ProfilePage());
  }
}
