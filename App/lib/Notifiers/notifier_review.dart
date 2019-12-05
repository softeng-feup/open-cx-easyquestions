import 'package:app/Model/review.dart';
import 'package:flutter/material.dart';

class ReviewNotifier extends ChangeNotifier {
  Map<String, Review> _reviewList = Map();
  Review currentReview;

  Map<String, Review> get reviewList => _reviewList;



}