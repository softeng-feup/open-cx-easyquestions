
import 'package:easyquestions/Pages/Ask.dart';
import 'package:easyquestions/Pages/register.dart';
import 'package:flutter/material.dart';
import 'Pages/homepage.dart';
import 'Pages/login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AskPage(),
    );
  }
}
