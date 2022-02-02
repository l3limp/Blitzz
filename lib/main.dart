import 'package:blitzz/screens/login_page.dart';
import 'package:blitzz/screens/splash_screen.dart';
import 'package:blitzz/screens/take_a_picture_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColorDark: Colors.white,
        primaryColor: Colors.white,
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const SplashScreen(),
        '/login_page': (context) => const LoginPage(),
        '/take_a_picture': (context) => const TakeAPicture(),
      },
    ),
  );
}
