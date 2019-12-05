import 'dart:collection';

import 'package:app/Model/talk.dart';
import 'package:flutter/cupertino.dart';

class TalkNotifier extends ChangeNotifier {
  List<Talk> _talkList = [];
  Talk _currentTalk;

  UnmodifiableListView<Talk> get talkList => UnmodifiableListView(_talkList);

  Talk get currentTalk => _currentTalk;

  setTalkList(List<Talk> talkList) {
    _talkList = talkList;
    notifyListeners();
  }

  set currentTalk(Talk talk) {
    _currentTalk = talk;
    notifyListeners();
  }
}