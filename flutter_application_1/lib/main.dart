import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/login.dart';
import 'package:flutter_application_1/pages/register.dart';
import 'package:flutter_application_1/pages/vista01.dart';
import 'package:flutter_application_1/pages/vista02.dart';
import 'package:flutter_application_1/pages/vista03.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Register(),
    );
  }
}
