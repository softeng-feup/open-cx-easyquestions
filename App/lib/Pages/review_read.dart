import 'package:app/API/db_review.dart';
import 'package:app/Components/error.dart';
import 'package:app/Components/loggedin_topbar.dart';
import 'package:app/Model/review.dart';
import 'package:app/Notifiers/notifier_auth.dart';
import 'package:app/Notifiers/notifier_review.dart';
import 'package:app/Notifiers/notifier_talk.dart';
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

    loadReviews_MDb(reviewNotifier);
    getTalkRelatedReviews(talkNotifier, reviewNotifier);
  }

  createAlertDialog(BuildContext context){
    return showDialog(context: context,builder: (context){
      return AlertDialog(
        title: Text("Only admins can do that!"),
      );
    });
  }

  createAlertDialog2(BuildContext context, ReviewNotifier reviewNotifier, TalkNotifier talkNotifier){
    return showDialog(context: context,builder: (context){
      return AlertDialog(
        title: Text("Press button to confirm!"),
        content: RaisedButton.icon(onPressed: () {
          removeReview_MDb(talkNotifier, reviewNotifier);
          //removeReview(talkNotifier, reviewNotifier);
          //2 pops para obrigar o refresh
          Navigator.pop(context, );
          Navigator.pop(context, );
        },
            icon: Icon(Icons.check), label: Text('Confirm')),
      );
    });
  }

  Widget build(BuildContext context) {
    AuthNotifier authNotifier = Provider.of<AuthNotifier>(context, listen: false);
    TalkNotifier talkNotifier = Provider.of<TalkNotifier>(context, listen: false);
    ReviewNotifier reviewNotifier = Provider.of<ReviewNotifier>(context, listen: false);

    //print(reviewNotifier.reviewList['5dfa4eee3900ae4d7805a454'].idDoc);

    List<Review> reviewsToDisplay = talkNotifier.currentTalk.reviews;
    talkNotifier.currentTalk.reviews=[];

    return Scaffold(
      appBar: loggedin_topBar(authNotifier, context, false),
      body: reviewsToDisplay.isEmpty ? noDataToShow() : displayReviews(reviewsToDisplay,authNotifier, talkNotifier, reviewNotifier),

    );
  }

  Widget displayReviews(List<Review> reviewsToDisplay,AuthNotifier authNotifier, TalkNotifier talkNotifier, ReviewNotifier reviewNotifier ){

    return ListView.separated(
      itemCount: reviewsToDisplay.length,
      separatorBuilder: (context, index) => Divider(),
      itemBuilder: (BuildContext context, int index)
      {
        reviewNotifier.currentReview = reviewsToDisplay[index];

        var _onPressed;
        if( authNotifier.user.permission == 2){
          _onPressed = ()  {
            createAlertDialog2(context, reviewNotifier, talkNotifier);
          };
        }
        if(authNotifier.user.permission == 0 || authNotifier.user.permission == 1 ){
          _onPressed = () {
            createAlertDialog(context);
          };
        }
        return ListTile(
          leading: CircleAvatar(
            child: Text("$index"),
          ), //maybe use profile's image instead of index
          isThreeLine: true,
          title: Text(reviewsToDisplay[index].authorUsername + " says..."),
          subtitle: Text(reviewsToDisplay[index].body),
          trailing: IconButton(
            icon: Icon(Icons.delete),
            onPressed: _onPressed,
          )
        );
      },


    );
  }

}

