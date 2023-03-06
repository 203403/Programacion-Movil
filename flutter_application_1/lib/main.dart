import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/login.dart';
import 'package:flutter_application_1/pages/register.dart';
import 'package:flutter_application_1/screens/body_boarding.dart';
import 'package:flutter_application_1/screens/home_page.dart';
import 'package:flutter_application_1/screens/recovery_pw_1.dart';
import 'package:flutter_application_1/screens/recovery_pw_2.dart';
import 'package:flutter_application_1/pages/verify_code.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    MaterialColor mycolor = const MaterialColor(
      0xff48197c,
      <int, Color>{
        50: Color(0xff48197c),
        100: Color(0xff48197c),
        200: Color(0xff48197c),
        300: Color(0xff48197c),
        400: Color(0xff48197c),
        500: Color(0xff48197c),
        600: Color(0xff48197c),
        700: Color(0xff48197c),
        800: Color(0xff48197c),
        900: Color(0xff48197c),
      },
    );
    return MaterialApp(
      title: 'All for my Pet',
      theme: ThemeData(
        primarySwatch: mycolor,
      ),
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => const BodyBoarding(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/homepage': (context) => const HomePage(),
        '/login': (context) => const Login(),
        '/register': (context) => const Register(),
        '/recovery1': (context) => const RecoveryPW1(),
        '/recovery2': (context) => const RecoveryPW2(),
        '/verify_code': (context) => const VerifyCode(),
      },
    );
  }
}
