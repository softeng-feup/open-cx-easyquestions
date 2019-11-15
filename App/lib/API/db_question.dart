import 'package:app/Model/question.dart';
import 'package:app/Notifiers/notifier_question.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

loadQuestions(QuestionNotifier questionNotifier) async {
  QuerySnapshot snapshot = await Firestore.instance.collection('Questions').getDocuments();

  List<Question> _questionList = [];

  snapshot.documents.forEach((document)
  {
    Question question = Question.fromMap(document.data);
    _questionList.add(question);
  });

  questionNotifier.setQuestionList(_questionList);
}