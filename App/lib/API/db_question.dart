
import 'package:app/Model/question.dart';
import 'package:app/Notifiers/notifier_question.dart';
import 'package:app/Notifiers/notifier_talk.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

loadQuestions(TalkNotifier talkNotifier, QuestionNotifier questionNotifier) async {
/*  QuerySnapshot snapshot = await Firestore.instance.collection('Questions').getDocuments();

  List<Question> _questionList = [];

  snapshot.documents.forEach((document)
  {
    Question question = Question.fromMap(document.data);
    _questionList.add(question);
  });
*/
  questionNotifier.setQuestionList(talkNotifier.currentTalk.questions);
}

addQuestion(TalkNotifier talkNotifier, Question question) async {
  CollectionReference questionRef = await Firestore.instance.collection('Questions');

  DocumentReference documentReference = await questionRef.add(question.toMap());
  question.id = documentReference.documentID;

  print("uploaded question successfully: ${question.toString()}");

  await documentReference.setData(question.toMap(), merge:true);
}