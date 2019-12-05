
import 'package:app/Model/talk.dart';
import 'package:app/Notifiers/notifier_talk.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


loadTalks(TalkNotifier talkNotifier) async {
  QuerySnapshot snapshot = await Firestore.instance.collection('Talk').getDocuments();

  List<Talk> _talkList = [];

  snapshot.documents.forEach((document)
  {

    Talk talk = Talk.fromMap(document.data);
    _talkList.add(talk);

  });

  talkNotifier.setTalkList(_talkList);
}

updateTalk(TalkNotifier talkNotifier) async{
  CollectionReference talkRef = Firestore.instance.collection('Talk');

  Talk talk = talkNotifier.currentTalk;

  await talkRef.document(talk.idDoc).updateData(talk.toMap());
}


