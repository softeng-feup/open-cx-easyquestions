
import 'dart:collection';

import 'package:app/Model/user.dart';
import 'package:flutter/cupertino.dart';

class ProfileNotifier extends ChangeNotifier {
  List<UserProfile> _userList = [];
  UserProfile _current;

  UnmodifiableListView<UserProfile> get userList => UnmodifiableListView(_userList);

  UserProfile get currentUser => _current;

  set userList(List<UserProfile> userList) {
    _userList = userList;
    debugPrint("user profiles updates");
    notifyListeners();
  }


  setCurrent(User user) {
    debugPrint(_userList.length.toString());
    debugPrint(user.email);
    for (final userL in _userList){
      if (userL.email == user.email){
        debugPrint(user.email);
        debugPrint(userL.email);
        _current = userL;
        notifyListeners();
      }
    }
    debugPrint("no user found");
  }
}