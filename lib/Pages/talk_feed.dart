import 'package:app/API/db_talk.dart';
import 'package:app/Components/loggedin_topbar.dart';
import 'package:app/Notifiers/notifier_auth.dart';
import 'package:app/Notifiers/notifier_talk.dart';
import 'package:app/Pages/talk_detail.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TalksFeed extends StatefulWidget{
  @override
  _TalksFeedState createState() => _TalksFeedState();
}

class _TalksFeedState extends State<TalksFeed> {
  @override
  void initState() {
    TalkNotifier talkNotifier = Provider.of<TalkNotifier>(context, listen:false);
    loadTalks(talkNotifier);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AuthNotifier authNotifier = Provider.of<AuthNotifier>(context, listen: false);
    TalkNotifier talkNotifier = Provider.of<TalkNotifier>(context, listen: false);


    return Scaffold(
      appBar: loggedin_topBar(authNotifier, context),
      body: ListView.separated( itemCount: talkNotifier.talkList.length, separatorBuilder: (BuildContext context, int index) => Divider(),itemBuilder: (BuildContext context, int index) {
          return ListTile(
              title: Text(talkNotifier.talkList[index].name),
              subtitle: Text(talkNotifier.talkList[index].body),
              onTap: () {
                talkNotifier.currentTalk = talkNotifier.talkList[index];
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (BuildContext context){
                      return TalkDetail();
                }));
              },
          );


      }
       ));

  }
}
