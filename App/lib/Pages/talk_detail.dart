import 'package:app/API/db_user.dart';
import 'package:app/Components/image_banner.dart';
import 'package:app/Components/loggedin_topbar.dart';
import 'package:app/Notifiers/notifier_auth.dart';
import 'package:app/Notifiers/notifier_talk.dart';
import 'package:app/Pages/question_read.dart';
import 'package:app/Pages/question_write.dart';
import 'package:app/Pages/review_read.dart';
import 'package:app/Pages/review_write.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TalkDetail extends StatefulWidget{
  @override
  _TalkDetailState createState() => _TalkDetailState();
}

class _TalkDetailState extends State<TalkDetail> {
  int _currentIndex = 0;

  initState(){
    TalkNotifier talkNotifier = Provider.of<TalkNotifier>(context, listen: false);
    getUserAvatar(talkNotifier, talkNotifier.currentTalk.speakerID);

  }

  Widget callPage(int currentIndex){
    switch(currentIndex){
      case 0:
        {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (BuildContext context){
                return ReadQuestion();
              }));
        }
        break;
      case 1:
        {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (BuildContext context){
                return WriteQuestion();
              }));
        }
        break;
      case 2:
        {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (BuildContext context){
                return ReadReview();
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

    String avatar = (talkNotifier.currentTalk.speakerAvatar);


    return Scaffold(
     appBar: loggedin_topBar(authNotifier, context),
      body:
      Stack(
        children: <Widget>[
          ClipPath(
            child: Container(color: Colors.blue),
            clipper: getClipper(),
          ),
          Positioned(
            width: MediaQuery.of(context).size.width,
            top: MediaQuery.of(context).size.height/14,
            child: Column(

              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 150,
                  height: 150,
                  decoration: speakerAvatar(avatar),
                  ),
                SizedBox(height: 10.0),
                Text(talkNotifier.currentTalk.name,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),

                Container(
                  padding: EdgeInsets.all(10) ,
                  height: MediaQuery.of(context).size.height/3.5,
                         child:
                         Column(
                          children: <Widget> [
                            Expanded(
                              child: SingleChildScrollView(
                                child:  Text(talkNotifier.currentTalk.body,
                                  style: TextStyle(
                                    fontSize: 12.5,
                                  ),
                                  textAlign: TextAlign.justify,
                                ),
                              ),
                            ),

                            SizedBox(height: 10.0),
                            Text(talkNotifier.currentTalk.schedule.toDate().toString(),
                              style: TextStyle(
                                fontSize: 10.0,
                              ),
                              textAlign: TextAlign.left,
                            ),
                            Text("by " + talkNotifier.currentTalk.speakerID, //TODO: change to name!
                              style: TextStyle(
                                fontSize: 10.0,
                              ),
                              textAlign: TextAlign.left,
                            ),

                           ]
                        )
                ),
              ],
            )
          )
        ],
      ),

      floatingActionButton: FloatingActionButton.extended(
        icon: Icon(Icons.thumb_up),
        label: Text("Review me!", textAlign: TextAlign.center,),
        foregroundColor: Colors.black87,
        onPressed: (){
          Navigator.of(context).push(
              MaterialPageRoute(builder: (BuildContext context){
                return WriteReview();
              }));
        },
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
            icon: Icon(Icons.question_answer),
            title: Text("Read all questions"),
          ),
          BottomNavigationBarItem(
            icon:  Icon(Icons.device_unknown),
            title: Text("Ask a question"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.thumb_up),
            title: Text('Read all reviews'),
          )
        ],

      ),
    );
  }


}