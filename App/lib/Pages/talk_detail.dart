import 'package:app/API/db_talk.dart';
import 'package:app/Components/loggedin_topbar.dart';
import 'package:app/Notifiers/notifier_auth.dart';
import 'package:app/Notifiers/notifier_question.dart';
import 'package:app/Notifiers/notifier_talk.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TalkDetail extends StatefulWidget{
  @override
  _TalkDetailState createState() => _TalkDetailState();
}

class _TalkDetailState extends State<TalkDetail> {
  @override
  void initState() {
    TalkNotifier talkNotifier = Provider.of<TalkNotifier>(context, listen: false);
    QuestionNotifier questionNotifier = Provider.of<QuestionNotifier>(context, listen: false);
    //loadTalkDetails(talkNotifier);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AuthNotifier authNotifier = Provider.of<AuthNotifier>(context, listen: false);
    TalkNotifier talkNotifier = Provider.of<TalkNotifier>(context, listen: false);

    return Scaffold(

    //  appBar: loggedin_topBar(authNotifier),
      body: Center(
          child: Container(
            child: Column(
                children: <Widget>[
                  Text(talkNotifier.currentTalk.name),
         ],
          )
         )
      )
    );
  }


}