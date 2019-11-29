import 'package:app/Model/answer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Question {
  String id;
  String body;
  //Participant _author;
  Timestamp createdAt;
  Answer answer;

  Question({this.body, this.answer});

  Map<String, dynamic> toMap(){
    return {
      'body': body,
      'createdAt': createdAt,
    };
  }

}