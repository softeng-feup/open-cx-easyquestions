import 'package:app/Model/question.dart';
import 'package:app/Model/user.dart';

class Talk{
  Speaker speaker;

  String name;
  String body;

  int rate; //likes (?)
  List questions;
 // Timestamp schedule;

  Talk({this.name, this.body, this.rate, this.questions});


  Talk.fromMap(Map<String, dynamic> data) {
    name = data['Name'];
    body = data['Body'];
    rate = data['Rate'];
  //  questions = (data['Questions']);
  //  schedule = data['Schedule'];
  }
}