import 'package:flutter/material.dart';
import 'package:test_shop_app/screens/login_screen.dart';
import 'package:test_shop_app/screens/my_home.dart';

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
      title: 'Test Shop App',
      // theme: ThemeData(
      //   primarySwatch:Color(0xff0575E6),
      // ),
      home: const MyHome(),
      // home: const LoginScreen(),
    );
  }
}

