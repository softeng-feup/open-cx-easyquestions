import 'package:app/Notifiers/notifier_question.dart';
import 'package:app/Notifiers/notifier_review.dart';
import 'package:app/Notifiers/notifier_talk.dart';
import 'package:app/Pages/welcome.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app/Notifiers/notifier_auth.dart';



void main() => runApp(MultiProvider(
  providers: [
    ChangeNotifierProvider(
      builder: (context) => AuthNotifier(),
    ),
    ChangeNotifierProvider(
        builder: (context) => TalkNotifier(),
    ),
    ChangeNotifierProvider(
      builder: (context) => QuestionNotifier(),
    ),
    ChangeNotifierProvider(
      builder: (context) => ReviewNotifier(),
    )
  ],
  child: MyApp(),
));


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FEUP',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        accentColor: Colors.lightBlue,
      ),
      home: Welcome(),

    );
  }
}
