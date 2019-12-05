import 'package:app/API/db_question.dart';
import 'package:app/Components/error.dart';
import 'package:app/Components/loggedin_topbar.dart';
import 'package:app/Model/question.dart';
import 'package:app/Model/talk.dart';
import 'package:app/Notifiers/notifier_auth.dart';
import 'package:app/Notifiers/notifier_question.dart';
import 'package:app/Notifiers/notifier_talk.dart';
import 'package:app/Pages/answer_write.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ReadQuestion extends StatefulWidget{
  @override
  _ReadQuestionState createState() => _ReadQuestionState();
}

String Reply = 'Reply';
String Delete = 'Delete';
String choice;

class _ReadQuestionState extends State<ReadQuestion>{
  initState(){
    TalkNotifier talkNotifier = Provider.of<TalkNotifier>(context, listen: false);
    QuestionNotifier questionNotifier = Provider.of<QuestionNotifier>(context, listen: false);

    loadQuestions(questionNotifier);
    getTalkRelatedQuestions(talkNotifier, questionNotifier);
  }

  createAlertDialog(BuildContext context){
    return showDialog(context: context,builder: (context){
      return AlertDialog(
        title: Text("Only Admins can do that!"),
      );
    });
  }

  createAlertDialog2(BuildContext context, QuestionNotifier questionNotifier, TalkNotifier talkNotifier){
    return showDialog(context: context,builder: (context){
      return AlertDialog(
        title: Text("Press button to confirm!"),
        content: RaisedButton.icon(onPressed: () {
          removeQuestion(talkNotifier, questionNotifier);
          //2 pops para obrigar o refresh
          Navigator.pop(context, );
          Navigator.pop(context, );
          },
            icon: Icon(Icons.check), label: Text('Confirm')),
      );
    });
  }

  createAlertDialog3(BuildContext context){
    return showDialog(context: context,builder: (context){
      return AlertDialog(
        title: Text("Only Speakers can do that!"),
      );
    });
  }

  Widget build(BuildContext context) {
    AuthNotifier authNotifier = Provider.of<AuthNotifier>(context, listen: false);
    TalkNotifier talkNotifier = Provider.of<TalkNotifier>(context, listen: false);
    QuestionNotifier questionNotifier = Provider.of<QuestionNotifier>(context, listen: false);

    List<Question> questionsToDisplay = talkNotifier.currentTalk.questions;
    talkNotifier.currentTalk.questions=[];

    return Scaffold(
      appBar: loggedin_topBar(authNotifier, context),
      body:
      (questionsToDisplay.isEmpty ? noDataToShow() : displayQuestions(questionsToDisplay, authNotifier, questionNotifier, talkNotifier)),
    );
  }

  Widget displayQuestions(List<Question> questionsToDisplay, AuthNotifier authNotifier, QuestionNotifier questionNotifier, TalkNotifier talkNotifier){
    print(authNotifier.user.permission);

    List<String> choices = <String>[Reply,Delete];
    return ListView.separated(
      itemCount: questionsToDisplay.length,
      separatorBuilder: (context, index) => Divider(),
      itemBuilder: (BuildContext context, int index)
      {
        questionNotifier.currentQuestion = questionsToDisplay[index];
        _choiceAction(String choice){
          if(choice == Delete && (authNotifier.user.permission == 0 || authNotifier.user.permission == 1)){
            createAlertDialog(context);
          }
          if(choice == Delete && authNotifier.user.permission == 2){
            createAlertDialog2(context, questionNotifier, talkNotifier);
          }
          if(choice == Reply && (authNotifier.user.permission == 0 || authNotifier.user.permission == 2 )){
            createAlertDialog3(context);
          }
          if(choice == Reply && authNotifier.user.permission == 1){
            print("Entrou no reply");
            Navigator.of(context).push(
                MaterialPageRoute(builder: (BuildContext context) {
                  return WriteAnswer();
                }));
            //enableAnswer(questionsToDisplay[index], questionNotifier, context);
          }
        }
        return ListTile(
          leading: CircleAvatar(
            child:
              Text("$index"),
          ), //maybe use profile's image instead of index
          isThreeLine: true,
          title: Text(questionsToDisplay[index].body),
          subtitle: (questionsToDisplay[index].answer != null ? Text(questionsToDisplay[index].answer) : Text("This question doesnt have an answer yet.")),
          trailing: (PopupMenuButton<String>(
            onSelected: _choiceAction,
            icon: Icon(Icons.more_horiz),
            itemBuilder: (BuildContext context){
              return choices.map((String choice){
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          ))
        );
      },

    );
  }

/* enableAnswer(Question question, QuestionNotifier questionNotifier, BuildContext context){


    questionNotifier.currentQuestion=question;
    print("Cheguei");
    return
      ButtonTheme(
        buttonColor: Colors.blue,
          minWidth: 60,
        child:
        RaisedButton(
           child: Icon(Icons.reply),
            textColor: Colors.white,
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (BuildContext context) {
                    return WriteAnswer();
                  }));
            })
      );

  }*/
}

