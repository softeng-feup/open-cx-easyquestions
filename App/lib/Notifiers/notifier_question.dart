import 'package:app/Model/question.dart';
import 'package:flutter/material.dart';

class QuestionNotifier extends ChangeNotifier {
  Map<String, Question> _questionList = Map();
  Question _currentQuestion;

  Map<String, Question> get questionList => _questionList;

  Question get currentQuestion => _currentQuestion;

}