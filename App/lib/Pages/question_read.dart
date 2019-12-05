import 'package:app/API/db_question.dart';
import 'package:app/Components/error.dart';
import 'package:app/Components/loggedin_topbar.dart';
import 'package:app/Model/question.dart';
import 'package:app/Notifiers/notifier_auth.dart';
import 'package:app/Notifiers/notifier_question.dart';
import 'package:app/Notifiers/notifier_talk.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ReadQuestion extends StatefulWidget{
  @override
  _ReadQuestionState createState() => _ReadQuestionState();
}

class _ReadQuestionState extends State<ReadQuestion>{
  initState(){
    TalkNotifier talkNotifier = Provider.of<TalkNotifier>(context, listen: false);
    QuestionNotifier questionNotifier = Provider.of<QuestionNotifier>(context, listen: false);

    loadQuestions(questionNotifier);
    getTalkRelatedQuestions(talkNotifier, questionNotifier);
  }

  Widget build(BuildContext context) {
    AuthNotifier authNotifier = Provider.of<AuthNotifier>(context, listen: false);
    TalkNotifier talkNotifier = Provider.of<TalkNotifier>(context, listen: false);

    List<Question> questionsToDisplay = talkNotifier.currentTalk.questions;
    talkNotifier.currentTalk.questions=[];

    return Scaffold(
      appBar: loggedin_topBar(authNotifier, context),
      body:
      (questionsToDisplay.isEmpty ? noDataToShow() : displayQuestions(questionsToDisplay)),
    );
  }

  Widget displayQuestions(List<Question> questionsToDisplay){
    return ListView.separated(
      itemCount: questionsToDisplay.length,
      separatorBuilder: (context, index) => Divider(),
      itemBuilder: (BuildContext context, int index)
      {
        return ListTile(
          leading: CircleAvatar(
            child: Text("$index"),
          ), //maybe use profile's image instead of index
          isThreeLine: true,
          title: Text(questionsToDisplay[index].body),
          subtitle: (questionsToDisplay[index].answer != null ?
          Text(questionsToDisplay[index].answer) : Text("This question doesnt have an answer yet.")),
          //TODO: adicionar createdAt em rodapé e o nome do autor das perguntas.
          /*
          if(questionsToDisplay[index].anonymous ? Text("by Anonymous") : Text("by" + questionsToDisplay[index].author))
           */
        );
      },

    );
  }
}

