import 'package:app/Model/question.dart';
import 'package:app/Model/review.dart';
import 'package:app/Model/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Talk{
  String idDoc;

  String name;
  String body;

  String speakerAvatar;
  String speakerName;
  String speakerID;

  Timestamp schedule;

  List questionIDs = [];

  List<Question> questions = [];

  List reviewsIDs = [];
  List<Review> reviews = [];

  Talk({this.idDoc, this.name, this.body, this.schedule, this.questionIDs, this.reviewsIDs, this.speakerID});


  Talk.fromMap(Map<dynamic, dynamic> data) {
    idDoc = data['idDoc'];
    name = data['Name'];
    body = data['Body'];
    schedule = data['Schedule'];
    speakerID = data['SpeakerID'];
    questionIDs = data['Questions'];
    reviewsIDs = data['Reviews'];
    speakerAvatar = data['SpeakerAvatar'];
    speakerName = data['SpeakerName'];
  }

  Map<String, dynamic> toMap(){
    return {
      'idDoc' : idDoc,
      'Name' : name,
      'Body' : body,
      'Schedule' : schedule,
      'Questions' : questionIDs,
      'Reviews' : reviewsIDs,
      'SpeakerID' : speakerID,
      'SpeakerAvatar' : speakerAvatar,
      'SpeakerName': speakerName,
    };
  }

  addQuestionID(String questionID){
    var temp = new List<String>.from(questionIDs);
    temp.add(questionID);
    this.questionIDs = temp;
  }

  addReviewID(String reviewID){
    var temp = new List<String>.from(reviewsIDs);
    temp.add(reviewID);
    this.reviewsIDs=temp;
}
}