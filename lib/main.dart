
import 'package:booking/layout/homeScreen.dart';
import 'package:booking/modules/serviceProviderScreen.dart';
import 'package:booking/modules/signin.dart';
import 'package:flutter/material.dart';

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
     home: signinScreen(),
    );
  }
}
