import 'package:app/Model/review.dart';
import 'package:app/Notifiers/notifier_review.dart';
import 'package:app/Notifiers/notifier_talk.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'db_talk.dart';

//switched to mongo
addReview(TalkNotifier talkNotifier, Review review) async {

  CollectionReference reviewRef = await Firestore.instance.collection('Reviews');

  DocumentReference documentReference = await reviewRef.add(review.toMap());

  review.idDoc = documentReference.documentID;
  review.createdAt = Timestamp.now();


  await documentReference.setData(review.toMap(), merge:true);

  talkNotifier.currentTalk.addReviewID(review.idDoc);
  updateTalk(talkNotifier);

}

//switched to mongo
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
  List ids = talkNotifier.currentTalk.reviewsIDs;

  for(int i=0; i<talkNotifier.currentTalk.reviewsIDs.length; i++){
    String key = talkNotifier.currentTalk.reviewsIDs[i];
    if (reviewNotifier.currentReview.idDoc == key) {

      ids.remove(key);
      talkNotifier.currentTalk.reviewsIDs=ids;
    }
  }
  updateTalk(talkNotifier);
}


//switched to mongo
removeReview(TalkNotifier talkNotifier, ReviewNotifier reviewNotifier) async {
  Review review = reviewNotifier.currentReview;

  await Firestore.instance.collection('Reviews').document(review.idDoc).delete();

  removeReviewFromTalk(talkNotifier, reviewNotifier);
  updateTalk(talkNotifier);
}