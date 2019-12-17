import 'package:app/API/db_question.dart';
import 'package:app/Components/image_banner.dart';
import 'package:app/Components/loggedin_topbar.dart';
import 'package:app/Model/question.dart';
import 'package:app/Notifiers/notifier_auth.dart';
import 'package:app/Notifiers/notifier_question.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WriteAnswer extends StatefulWidget{
  @override
  _WriteAnswerState createState() => _WriteAnswerState();
}

class _WriteAnswerState extends State<WriteAnswer>{
  final GlobalKey<FormState> _answerKey = GlobalKey<FormState>();
  Question question = Question();

  @override
  Widget build(BuildContext context) {
    AuthNotifier authNotifier = Provider.of<AuthNotifier>(context, listen: false);
    QuestionNotifier questionNotifier = Provider.of<QuestionNotifier>(context, listen: false);
    question = questionNotifier.currentQuestion;

    return Scaffold(
        appBar: loggedin_topBar(authNotifier, context, false),
        resizeToAvoidBottomPadding: false,
        body:
        Stack(
            children: <Widget>[
              ImageBanner("assets/images/login.png", MediaQuery.of(context).size.height),
              new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
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
                      new Form(
                        key: _answerKey,
                        autovalidate: true,
                        child:
                        Padding(
                            padding: EdgeInsets.all(20),
                            child: Column(
                                children: <Widget>[

                                  Text(questionNotifier.currentQuestion.body,
                                    style: TextStyle(
                                        fontSize: 15.0,
                                        fontStyle: FontStyle.italic
                                    ),),

                                  TextFormField(
                                    validator: (input) {
                                      if(input.isEmpty){
                                        return 'In order to submit, you need to write something!'; //TODO: verification with regex
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        labelText: 'Tap here to write your answer',
                                        contentPadding: const EdgeInsets.all(20.0)
                                    ),
                                    onSaved: (input) => question.answer = input,
                                  ),

                                  RaisedButton(
                                    padding: const EdgeInsets.fromLTRB(5.0, 4.0, 5.0, 4.0),
                                    textColor: Colors.white,
                                    color: Colors.blue,
                                    onPressed: submitAnswer,
                                    child: Text('Submit'),

                                  ),
                                ]
                            )
                        ),
                      ),
                    )
                  ]
              )
            ]
        )
    );
  }
    submitAnswer(){
      if (!_answerKey.currentState.validate()) {
        return;
      }
      _answerKey.currentState.save();

      QuestionNotifier questionNotifier = Provider.of<QuestionNotifier>(context, listen: false);

      questionNotifier.currentQuestion=question;

      updateQuestion(questionNotifier);

      Navigator.pop(context,);
    }
}

