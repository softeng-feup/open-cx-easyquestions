import 'package:app/API/db_review.dart';
import 'package:app/Components/image_banner.dart';
import 'package:app/Components/loggedin_topbar.dart';
import 'package:app/Model/review.dart';
import 'package:app/Notifiers/notifier_auth.dart';
import 'package:app/Notifiers/notifier_talk.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WriteReview extends StatefulWidget{
  @override
  _WriteReviewState createState() => _WriteReviewState();
}

class _WriteReviewState extends State<WriteReview>{

  final GlobalKey<FormState> _reviewKey = GlobalKey<FormState>();
  Review review = Review();


  @override
  Widget build(BuildContext context) {
    AuthNotifier authNotifier = Provider.of<AuthNotifier>(context, listen: false);

    return Scaffold(
      key: Key('WriteReview'),
        appBar: loggedin_topBar(authNotifier, context, false),
        resizeToAvoidBottomPadding: false,
        body:
        Stack(
            children: <Widget>[
              ImageBanner("assets/images/login.png", MediaQuery.of(context).size.height),
              new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: double.infinity,
                      height: 350,
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.8),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black12,
                                offset: Offset(0.0, 15.0),
                                blurRadius: 15.0),
                            BoxShadow(
                                color: Colors.black12,
                                offset: Offset(0.0, -10.0),
                                blurRadius: 10.0),
                          ]
                      ),
                      child:
                      Form(
                          key: _reviewKey,
                          child: Column(
                              children: <Widget>[

                                TextFormField(
                                  validator: (input) {
                                    if(input.isEmpty){
                                      return 'In order to submit, you need to write something!'; //TODO: verification with regex
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      labelText: 'Tap here to write your review',
                                      contentPadding: const EdgeInsets.all(20.0)
                                  ),
                                  onSaved: (input) => review.body = input,

                                ),


                                RaisedButton(
                                  onPressed: submitReview,
                                  child: Text('Submit'),
                                ),
                                RaisedButton(
                                  onPressed: () => Navigator.pop(context,),
                                  child: Text('Back'),
                                )
                              ]
                          )
                      ),
                    ),
                  ]
              )
            ]
        )
    );
  }

  submitReview(){
    if (!_reviewKey.currentState.validate()) {
      return;
    }
    _reviewKey.currentState.save();

    AuthNotifier authNotifier = Provider.of<AuthNotifier>(context, listen: false);

    TalkNotifier talkNotifier = Provider.of<TalkNotifier>(context, listen: false);

    review.talkid = talkNotifier.currentTalk.idDoc;
    review.authorUsername = authNotifier.firebaseUser.displayName;

    addReview(talkNotifier, review);

    Navigator.pop(context,);
  }
}

