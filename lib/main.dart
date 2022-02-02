import 'package:blitzz/screens/direction_screen.dart';
import 'package:blitzz/screens/home_screen.dart';
import 'package:blitzz/screens/splash_screen.dart';
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
        '/': (context) => const HomeScreen(),
        '/directions': (context) => const DirectionScreen(),
      },
    ),
  );
}
