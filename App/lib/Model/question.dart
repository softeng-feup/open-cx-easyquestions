import 'package:cloud_firestore/cloud_firestore.dart'; //to use timestamp

class Question {
  String idDoc;

  String body;

  Timestamp createdAt;

  String authorID;

  String answer;

  bool anonymous;


  Question({this.idDoc, this.body, this.createdAt, this.authorID, this.answer});

  Question.fromMap(Map<String, dynamic> data) {
    idDoc = data['idDoc'];
    body = data['Body'];
    createdAt = data['CreatedAt'];
    authorID = data['Author'];
    answer= data['Answer'];
    anonymous= data['Anonymous'];
  }

  Map<String, dynamic> toMap(){
    return {
      'Body': body,
      'CreatedAt': createdAt,
      'Author': authorID,
      'Answer': answer,
      'idDoc' : idDoc,
      'Anonymous': anonymous,
    };
  }

}