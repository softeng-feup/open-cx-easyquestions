import 'package:app/Components/loggedin_topbar.dart';
import 'package:app/Notifiers/notifier_auth.dart';
import 'package:app/Notifiers/notifier_question.dart';
import 'package:app/Notifiers/notifier_talk.dart';
import 'package:app/Pages/question_read.dart';
import 'package:app/Pages/question_write.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TalkDetail extends StatefulWidget{
  @override
  _TalkDetailState createState() => _TalkDetailState();
}

class _TalkDetailState extends State<TalkDetail> {
  int _currentIndex = 0;


/*
  @override
  void initState() {
    TalkNotifier talkNotifier = Provider.of<TalkNotifier>(context, listen: false);
    super.initState();
  }
*/

  Widget callPage(int currentIndex){
    switch(currentIndex){
      case 0:
        {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (BuildContext context){
                return WriteQuestion();
              }));
        }
        break;
      case 1:
        {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (BuildContext context){
                return ReadQuestion();
              }));
        }
        break;
      default: break;
    }
  }


  @override
  Widget build(BuildContext context) {
    AuthNotifier authNotifier = Provider.of<AuthNotifier>(context, listen: false);
    TalkNotifier talkNotifier = Provider.of<TalkNotifier>(context, listen: false);

    return Scaffold(
     appBar: loggedin_topBar(authNotifier, context),
      body: Center(
          child: Container(
            child: Column(
                children: <Widget>[
                  Text(talkNotifier.currentTalk.name),
                  Text("Rate: " + talkNotifier.currentTalk.rate.toString()),
                  Text(talkNotifier.currentTalk.body)
         ],
          )
         )
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (value) {
          _currentIndex=value;
          setState((){});
          callPage(_currentIndex);
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.device_unknown),
            title: Text('Ask a question'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chrome_reader_mode),
            title: Text('Read all answers'),
          )
        ],
      ),
    );
  }


}