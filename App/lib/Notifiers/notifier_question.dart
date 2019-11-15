import 'dart:collection';

import 'package:app/Model/question.dart';
import 'package:flutter/material.dart';

class QuestionNotifier extends ChangeNotifier {
  List<Question> _questionList = [];
  Question _currentQuestion;

  UnmodifiableListView<Question> get questionList => UnmodifiableListView(_questionList);

  Question get currentQuestion => _currentQuestion;

  setQuestionList(List<Question> questionList) {
    _questionList = questionList;
    notifyListeners();
  }

  set currentQuestion(Question question) {
    _currentQuestion = question;
    notifyListeners();
  }
}