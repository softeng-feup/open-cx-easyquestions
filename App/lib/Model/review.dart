import 'package:app/Model/talk.dart';
import 'package:app/Model/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Review {
  String idDoc;

  User author;
  String authorid;

  Timestamp createdAt;

  Talk talk;
  String talkid;

  String body;

  Review({this.authorid, this.createdAt, this.talkid});

  Review.fromMap(Map<dynamic, dynamic> data) {
    idDoc = data['idDoc'];
    authorid = data['Author'];
    body = data['Body'];
    createdAt = data['CreatedAt'];
    talkid = data['Talk'];
  }

  Map<String, dynamic> toMap(){
    return {
      'idDoc' : idDoc,
      'Body' : body,
      'Author' : authorid,
      'CreatedAt' : createdAt,
      'Talk' : talkid,
    };
  }

}