import 'package:app/Model/question.dart';
import 'package:app/Model/user.dart';

class Talk{
  Speaker speaker;

  String name;
  String body;

  int rate; //likes (?)
  List<Question> questions;
 // Timestamp schedule;

  Talk.fromMap(Map<String, dynamic> data) {
    name = data['Name'];
    body = data['Body'];
    rate = data['Rate'];

    questions = (data['Questions']);
  //  schedule = data['Schedule'];
  }
}