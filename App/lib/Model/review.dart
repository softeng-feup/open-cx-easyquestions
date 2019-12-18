import 'package:app/Model/talk.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Review {
  String idDoc;

  String authorUsername;

  String createdAt;

  Talk talk;
  String talkid;

  String body;

  Review({this.idDoc, this.authorUsername, this.createdAt, this.talkid, this.body});

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
      'body' : body,
      'authorUsername' : authorUsername,
      'createdAt' : createdAt,
      'talkID' : talkid,
    };
  }

 factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
        idDoc: json['idDoc'],
        authorUsername: json['authorUsername'],
        createdAt: json['createdAt'],
        talkid: json['talkID'],
        body: json['body']
    );
  }


  Map<String, dynamic> toJson(){
  /*  var map  = new Map<String, dynamic>();
    map['idDoc'] = idDoc;

    return {
      'idDoc' : idDoc,
      'body' : body,
      'authorUsername' : authorUsername,
      'createdAt' : createdAt,
      'talkid' : talkid,
    };

   */
  }


}