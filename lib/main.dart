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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Poppins'),
      initialRoute: '/homescreen', // Halaman pertama yang akan dibuka
      routes: {
        '/homescreen': (context) => const HomeScreen(), // Halaman pertama
        '/login': (context) => const LoginPage(), // Halaman login
        '/signup': (context) => const SignupPage(), // Halaman signup
        '/forgotpassword': (context) =>
            const ForgotPassword(), // Halaman lupa password
        '/home': (context) => const HomePage(), // Halaman home setelah login
        '/cart': (context) => const CartPage(), // Halaman keranjang
        '/profile': (context) => const ProfilePage(), // Halaman profil
      },
    );
  }
}
