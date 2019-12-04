import 'package:app/Model/question.dart';
import 'package:app/Notifiers/notifier_question.dart';
import 'package:app/Notifiers/notifier_talk.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'db_talk.dart';

loadQuestions(QuestionNotifier questionNotifier) async {
  QuerySnapshot snapshot = await Firestore.instance.collection('Questions').getDocuments();
  snapshot.documents.forEach((document)
  {
    Question question = Question.fromMap(document.data);
    questionNotifier.questionList[question.idDoc] = question;
  });
}

getTalkRelatedQuestions(TalkNotifier talkNotifier, QuestionNotifier questionNotifier){
  for(int i=0; i<talkNotifier.currentTalk.questionIDs.length; i++)
    {
      String key = talkNotifier.currentTalk.questionIDs[i];
      if (questionNotifier.questionList[key] != null) {
        talkNotifier.currentTalk.questions.add(questionNotifier.questionList[key]);
      }
    }
}

addQuestion(TalkNotifier talkNotifier, QuestionNotifier questionNotifier, Question question) async {


  CollectionReference questionRef = await Firestore.instance.collection('Questions');

  DocumentReference documentReference = await questionRef.add(question.toMap());

  question.idDoc = documentReference.documentID;
  question.createdAt = Timestamp.now();



  await documentReference.setData(question.toMap(), merge:true);

  talkNotifier.currentTalk.addQuestionID(question.idDoc);
  updateTalk(talkNotifier);
}

updateQuestion(QuestionNotifier questionNotifier) async{

    CollectionReference questionRef = Firestore.instance.collection('Questions');

    Question question = questionNotifier.currentQuestion;

    await questionRef.document(question.idDoc).updateData(question.toMap());

}