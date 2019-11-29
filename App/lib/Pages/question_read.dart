import 'package:app/API/db_question.dart';
import 'package:app/Components/loggedin_topbar.dart';
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

    loadQuestions(talkNotifier, questionNotifier);
  }

  Widget build(BuildContext context) {
    AuthNotifier authNotifier = Provider.of<AuthNotifier>(context, listen: false);
    QuestionNotifier questionNotifier = Provider.of<QuestionNotifier>(context, listen: false);


    return Scaffold(
      appBar: loggedin_topBar(authNotifier, context),
      body:
        ListView.separated(
            itemCount: questionNotifier.questionList.length,
            separatorBuilder: (context, index) => Divider(),
            itemBuilder: (BuildContext context, int index)
            {
              return ListTile(
                leading: CircleAvatar(
                  child: Text("$index"),
                ), //maybe use profile's image instead of index
                isThreeLine: true,
                title: Text(questionNotifier.questionList[index].body),
                subtitle: Text(questionNotifier.questionList[index].answer.body),
              );
            }

        )
    );
  }
}

