import 'package:easyquestions/Pages/login.dart';
import 'package:easyquestions/Pages/register.dart';
import 'package:easyquestions/Objects/homeScreen.dart';
import 'package:flutter/material.dart';



class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: homeScreen(),
        routes: {
          'loginScreen': (context) => LoginPage(),
          'registerScreen': (context) => RegisterPage(),
        });
  }

}


