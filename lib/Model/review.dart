import 'package:app/Model/talk.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Review {
  String idDoc;

  String authorUsername;

  Timestamp createdAt;

  Talk talk;
  String talkid;

  String body;

  Review({this.authorUsername, this.createdAt, this.talkid});

  Review.fromMap(Map<dynamic, dynamic> data) {
    idDoc = data['idDoc'];
    authorUsername = data['Author'];
    body = data['Body'];
    createdAt = data['CreatedAt'];
    talkid = data['Talk'];
  }

  Map<String, dynamic> toMap(){
    return {
      'idDoc' : idDoc,
      'Body' : body,
      'Author' : authorUsername,
      'CreatedAt' : createdAt,
      'Talk' : talkid,
    };
  }

}