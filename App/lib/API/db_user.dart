import 'dart:io';

import 'package:app/Model/user.dart';
import 'package:app/Notifiers/notifier_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:uuid/uuid.dart';
import 'package:path/path.dart' as path;


void getUserFromDatabase(AuthNotifier authNotifier, String authID) async {
  QuerySnapshot snapshot = await Firestore.instance.collection('Users').getDocuments();

  snapshot.documents.forEach((document)
  {
    User user = User.fromMap(document.data);

    if(user.authID == authID) {
      authNotifier.user = user;
    }
  });
}


registerUser(FirebaseUser firebaseUser, String fullname, String age, String type) async {

  User user;

  if(type == 'Admin')
    user = new User(permission: 2, avatar: null,fullname: fullname, age: age, description: null, authID: firebaseUser.uid);
  if(type == 'Speaker')
    user = new User(permission: 1, avatar: null, fullname: fullname, age: age, description: null, authID: firebaseUser.uid);
  if(type == 'Normal')
    user = new User(permission: 0, avatar: null, fullname: fullname, age: age, description: null, authID: firebaseUser.uid);




  CollectionReference userRef = await Firestore.instance.collection('Users');

  DocumentReference documentReference = await userRef.add(user.toMap());

  user.idDoc = documentReference.documentID;


  await documentReference.setData(user.toMap(), merge:true);

}

updateUser(User user, File image) async{
  if (image != null) {
    print("uploading image");

    var fileExtension = path.extension(image.path);
    print(fileExtension);

    var uuid = Uuid().v4();

    final StorageReference firebaseStorageRef =
    FirebaseStorage.instance.ref().child('images/$uuid$fileExtension');

    await firebaseStorageRef
        .putFile(image)
        .onComplete
        .catchError((onError) {
      print(onError);
      return false;
    });

    String url = await firebaseStorageRef.getDownloadURL();
    user.avatar = url;
  }

  CollectionReference userRef = Firestore.instance.collection('Users');

  userRef.document(user.idDoc).updateData(user.toMap());

}