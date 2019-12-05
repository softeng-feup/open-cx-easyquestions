import 'package:cloud_firestore/cloud_firestore.dart'; //to use timestamp

class Question {
  String idDoc;

  String body;

  Timestamp createdAt;

  String authorUsername;

  String answer;

  bool anonymous;


  Question({this.idDoc, this.body, this.createdAt, this.authorUsername, this.answer});

  Question.fromMap(Map<String, dynamic> data) {
    idDoc = data['idDoc'];
    body = data['Body'];
    createdAt = data['CreatedAt'];
    authorUsername = data['Author'];
    answer= data['Answer'];
    anonymous= data['Anonymous'];
  }

  Map<String, dynamic> toMap(){
    return {
      'Body': body,
      'CreatedAt': createdAt,
      'Author': authorUsername,
      'Answer': answer,
      'idDoc' : idDoc,
      'Anonymous': anonymous,
    };
  }

}