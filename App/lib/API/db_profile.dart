
import 'dart:io';
import 'package:app/Model/user.dart';
import 'package:app/Notifiers/notifier_profile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as path;
import 'package:uuid/uuid.dart';

loadProfiles(ProfileNotifier profileNotifier, User user) async{
  QuerySnapshot snapshot = await Firestore.instance.collection('Users').getDocuments();

  List<UserProfile> _userProfiles = [];

  snapshot.documents.forEach((document){
    UserProfile userProfile = UserProfile.fromMap(document.data);
    _userProfiles.add(userProfile);
  });
  profileNotifier.userList = _userProfiles;
  profileNotifier.setCurrent(user);
  profileNotifier.currentUser.setUser = user;
}


updateProfile(UserProfile userProfile) {
  CollectionReference usersRef = Firestore.instance.collection('Users');
  usersRef.document(userProfile.id).updateData(userProfile.toMap());
}

addProfile(UserProfile userProfile) async {
  CollectionReference usersRef = Firestore.instance.collection('Users');
  DocumentReference documentRef = await usersRef.add(userProfile.toMap());
  userProfile.id = documentRef.documentID;
  await documentRef.setData(userProfile.toMap(), merge: true);

}


addImage(ProfileNotifier profileNotifier, UserProfile userProfile, File image) async {
  if (image != null) {
    print("uploading image");

    var fileExtension = path.extension(image.path);
    print(fileExtension);

    var uuid = Uuid().v4();

    final StorageReference firebaseStorageRef =
    FirebaseStorage.instance.ref().child('foods/images/$uuid$fileExtension');

    await firebaseStorageRef
        .putFile(image)
        .onComplete
        .catchError((onError) {
      print(onError);
      return false;
    });

    String url = await firebaseStorageRef.getDownloadURL();
    userProfile.image = url;
    updateProfile(userProfile);
    loadProfiles(profileNotifier, profileNotifier.currentUser.user);

  }
}