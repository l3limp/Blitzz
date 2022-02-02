
import 'package:blitzz/screens/direction_screen.dart';
import 'package:blitzz/screens/home_screen.dart';
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
        '/home': (context) => const HomeScreen(),
        '/directions': (context) => const DirectionScreen(),
        '/login_page': (context) => const LoginPage(),
        '/take_a_picture': (context) => const TakeAPicture(),

      },
    ),
  );
}
