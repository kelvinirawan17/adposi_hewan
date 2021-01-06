import './welcome_screen/screen/splashscreen.dart';
import './home_screen/home_screen.dart';
import './detail_screen/detail_screen.dart';
import './profile_screen/profile_screen.dart';
import './welcome_screen/screen/login.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SplashScreen(),
    );
  }
}
