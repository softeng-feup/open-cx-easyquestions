import 'package:app/API/db_user.dart';
import 'package:app/Model/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthNotifier extends ChangeNotifier {
  FirebaseUser firebaseUser;

  User user;


  void setUser(FirebaseUser user) {
    firebaseUser = user;

    if(user != null)
      getUserFromDatabase(this, firebaseUser.uid);

    notifyListeners();
  }

}