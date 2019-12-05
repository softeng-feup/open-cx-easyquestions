
import 'dart:io';
import 'package:app/Model/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as path;
import 'package:uuid/uuid.dart';


updateProfile(User userProfile) {
  CollectionReference usersRef = Firestore.instance.collection('Users');
  usersRef.document(userProfile.idDoc).updateData(userProfile.toMap());

}


addImage(User userProfile, File image) async {
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
    userProfile.avatar = url;
    updateProfile(userProfile);

  }
}