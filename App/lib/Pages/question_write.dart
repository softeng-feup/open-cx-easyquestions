import 'package:app/API/db_question.dart';
import 'package:app/Components/image_banner.dart';
import 'package:app/Components/loggedin_topbar.dart';
import 'package:app/Model/question.dart';
import 'package:app/Notifiers/notifier_auth.dart';
import 'package:app/Notifiers/notifier_question.dart';
import 'package:app/Notifiers/notifier_talk.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WriteQuestion extends StatefulWidget{
  @override
  _WriteQuestionState createState() => _WriteQuestionState();
}

class _WriteQuestionState extends State<WriteQuestion>{
  final GlobalKey<FormState> _questionKey = GlobalKey<FormState>();
  Question question = Question();
  bool value = false;

  @override
  Widget build(BuildContext context) {
    AuthNotifier authNotifier = Provider.of<AuthNotifier>(context, listen: false);

    return Scaffold(
      appBar: loggedin_topBar(authNotifier, context),
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
                          key: _questionKey,
                          child: Column(
                             children: <Widget>[
                                CircleAvatar(
                                  child: Text("?"),
                                ),
                                TextFormField(
                                  validator: (input) {
                                    if(input.isEmpty){
                                      return 'In order to submit, you need to write something!'; //TODO: verification with regex
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      labelText: 'Tap here to write your question',
                                      contentPadding: const EdgeInsets.all(20.0)
                                  ),
                                  onSaved: (input) => question.body = input,

                                ),

                              CheckboxListTile(
                                title: Text("Anonymous question."),
                                value: value,
                                onChanged: (bool ans) {
                                  setState(() {
                                    value = ans;
                                  });
                                }
                              ),
                              RaisedButton(
                                onPressed: submitQuestion,
                                child: Text('Submit'),
                              ),
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

  submitQuestion(){
    if (!_questionKey.currentState.validate()) {
      return;
    }
    _questionKey.currentState.save();

    question.answer=null;
    question.anonymous = value;
    AuthNotifier authNotifier = Provider.of<AuthNotifier>(context, listen:false);
    question.authorUsername = authNotifier.firebaseUser.displayName;

    QuestionNotifier questionNotifier = Provider.of<QuestionNotifier>(context, listen: false);
    TalkNotifier talkNotifier = Provider.of<TalkNotifier>(context, listen: false);

    addQuestion(talkNotifier, questionNotifier, question);

    Navigator.pop(context,);
  }
}

