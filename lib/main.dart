import 'dart:ui';

import 'package:bmicalculator/constants/app_constants.dart';
import 'package:bmicalculator/screens/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BMI CALCULATOR',
      theme: ThemeData(
/*         primaryColor: accentHexColor,
        textTheme: TextTheme(headline3:TextStyle(fontWeight: FontWeight.w300)), */
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity
      ),
      home:const HomeScreen(),
    );
  }
}

