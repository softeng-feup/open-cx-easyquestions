import 'dart:convert';

import 'package:app/Model/review.dart';
import 'package:app/Notifiers/notifier_review.dart';
import 'package:app/Notifiers/notifier_talk.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart' as http;
import 'package:uuid/uuid.dart';

import 'db_talk.dart';

//change to own ipv4 add
String URL_CONNECTION_TO_DB = 'http://0.0.0.0:5000/reviews/';

//switched to mongo
addReview_MDb(TalkNotifier talkNotifier, Review review) async{
  review.createdAt = Timestamp.now().toDate().toString();

  review.idDoc = Uuid().v1().toString();

  http.Response response = await http.post(URL_CONNECTION_TO_DB, headers: {"Content-type":"application/json"}, body: jsonEncode(review.toMap()));

  final int statusCode = response.statusCode;
  if (statusCode < 200 || statusCode > 400 || json == null) {
    throw new Exception("Error while fetching data");
  }

  talkNotifier.currentTalk.addReviewID(review.idDoc);
  updateTalk(talkNotifier);

}

addReview(TalkNotifier talkNotifier, Review review) async {
  CollectionReference reviewRef = await Firestore.instance.collection('Reviews');

  DocumentReference documentReference = await reviewRef.add(review.toMap());

  review.idDoc = documentReference.documentID;
  review.createdAt = Timestamp.now().toDate().toString();


  await documentReference.setData(review.toMap(), merge:true);

  talkNotifier.currentTalk.addReviewID(review.idDoc);
  updateTalk(talkNotifier);
}

//switched to mongo
loadReviews_MDb(ReviewNotifier reviewNotifier) async {
  final response = await http.get(URL_CONNECTION_TO_DB);

  if (response.statusCode == 200) {
    // If the call to the server was successful, parse the JSON.
    final json_decode = jsonDecode(response.body);
    int n_reviews = json_decode.length;

    for(int i=0; i < n_reviews; i++ ) {
      Review review = Review.fromJson(json_decode[i]);
      reviewNotifier.reviewList[review.idDoc] = review;
    }
  } else {
    // If that call was not successful, throw an error.
    throw Exception('Failed to load reviews!');
  }
}

loadReviews(ReviewNotifier reviewNotifier) async {
  QuerySnapshot snapshot = await Firestore.instance.collection('Reviews').getDocuments();
  snapshot.documents.forEach((document)
  {
    Review review = Review.fromMap(document.data);
    reviewNotifier.reviewList[review.idDoc] = review;
  });
}

getTalkRelatedReviews(TalkNotifier talkNotifier, ReviewNotifier reviewNotifier){
  for(int i=0; i<talkNotifier.currentTalk.reviewsIDs.length; i++)
  {
    String key = talkNotifier.currentTalk.reviewsIDs[i];
    if (reviewNotifier.reviewList[key] != null) {
      talkNotifier.currentTalk.reviews.add(reviewNotifier.reviewList[key]);
    }
  }
}

removeReviewFromTalk(TalkNotifier talkNotifier, ReviewNotifier reviewNotifier)
{
  var ids = new List<String>.from(talkNotifier.currentTalk.reviewsIDs);

  for(int i=0; i<talkNotifier.currentTalk.reviewsIDs.length; i++){
    String key = talkNotifier.currentTalk.reviewsIDs[i];
    if (reviewNotifier.currentReview.idDoc == key) {

      ids.remove(key);
      talkNotifier.currentTalk.reviewsIDs=ids;
    }
  }
  updateTalk(talkNotifier);
}


removeReview_MDb(TalkNotifier talkNotifier, ReviewNotifier reviewNotifier) async {
  Review review = reviewNotifier.currentReview;
  String url = URL_CONNECTION_TO_DB + review.idDoc;

  final response = await http.delete(url);

  if (response.statusCode == 200) {
    // If the call to the server was successful, update talk
    removeReviewFromTalk(talkNotifier, reviewNotifier);
    updateTalk(talkNotifier);

  } else {
    // If that call was not successful, throw an error.
    throw Exception('Failed to delete review!');
  }
}


//switched to mongo
removeReview(TalkNotifier talkNotifier, ReviewNotifier reviewNotifier) async {
  Review review = reviewNotifier.currentReview;

  await Firestore.instance.collection('Reviews').document(review.idDoc).delete();

  removeReviewFromTalk(talkNotifier, reviewNotifier);
  updateTalk(talkNotifier);
}