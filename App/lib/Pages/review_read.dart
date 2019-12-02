import 'package:app/API/db_review.dart';
import 'package:app/Components/error.dart';
import 'package:app/Components/loggedin_topbar.dart';
import 'package:app/Model/review.dart';
import 'package:app/Notifiers/notifier_auth.dart';
import 'package:app/Notifiers/notifier_review.dart';
import 'package:app/Notifiers/notifier_talk.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ReadReview extends StatefulWidget{
  @override
  _ReadReviewState createState() => _ReadReviewState();
}

class _ReadReviewState extends State<ReadReview>{
  initState(){
    TalkNotifier talkNotifier = Provider.of<TalkNotifier>(context, listen: false);
    ReviewNotifier reviewNotifier = Provider.of<ReviewNotifier>(context, listen: false);

    loadReviews(reviewNotifier);
    getTalkRelatedReviews(talkNotifier, reviewNotifier);
  }

  Widget build(BuildContext context) {
    AuthNotifier authNotifier = Provider.of<AuthNotifier>(context, listen: false);
    TalkNotifier talkNotifier = Provider.of<TalkNotifier>(context, listen: false);

    List<Review> reviewsToDisplay = talkNotifier.currentTalk.reviews;
    talkNotifier.currentTalk.reviews=[];

    return Scaffold(
      appBar: loggedin_topBar(authNotifier, context),
      body:
      (reviewsToDisplay.isEmpty ? noDataToShow() : displayReviews(reviewsToDisplay)),

    );
  }

  Widget displayReviews(List<Review> reviewsToDisplay){
    return ListView.separated(
      itemCount: reviewsToDisplay.length,
      separatorBuilder: (context, index) => Divider(),
      itemBuilder: (BuildContext context, int index)
      {
        return ListTile(
          leading: CircleAvatar(
            child: Text("$index"),
          ), //maybe use profile's image instead of index
          isThreeLine: true,
          title: Text(reviewsToDisplay[index].authorUsername + " says...",
          style: TextStyle(

          ),),
          subtitle: Text(reviewsToDisplay[index].body),
          //add data
        );
      },

    );
  }
}

