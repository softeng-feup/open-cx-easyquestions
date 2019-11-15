import 'package:app/Model/answer.dart';

class Question {
  String body;
  //Participant _author;
 // DateTime _dateTime;

  Answer answer;


  Question.fromMap(Map<String, dynamic> data) {
    // = data['Author'];
    body = data['Body'];
    answer = data['Answer'];
  }

  Map<String, dynamic> toMap() => {
    'Body': body,
    'Answer': answer,
  };

}