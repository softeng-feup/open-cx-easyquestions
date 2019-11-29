import 'package:app/Model/answer.dart';
import 'package:app/Model/question.dart';
import 'package:app/Model/talk.dart';
import 'package:app/Notifiers/notifier_question.dart';
import 'package:app/Notifiers/notifier_talk.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


loadTalks(TalkNotifier talkNotifier) async {
  QuerySnapshot snapshot = await Firestore.instance.collection('Talk').getDocuments();

  List<Talk> _talkList = [];

  snapshot.documents.forEach((document)
  {
    //Garantir que todas as perguntas que vao para a questionList têm uma resposta. Senao nao entram

    Answer answer1 = new Answer(body:"Answer 1 here...");
    Answer answer2 = new Answer(body:"Answer 2 here...");

    List<Question> questions = [Question(body:"Question 1 here!", answer:answer1), Question(body:"Question 2 here!", answer: answer2)];
    String name = document['Name'];
    String body = document['Body'];
    int rate = document['Rate'];

    _talkList.add(Talk(name:name, body:body, rate:rate, questions:questions));
  });

  talkNotifier.setTalkList(_talkList);
}

