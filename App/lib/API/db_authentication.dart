import 'package:firebase_auth/firebase_auth.dart';
import 'package:app/Notifiers/notifier_auth.dart';

import 'db_user.dart';


initializeCurrentUser(AuthNotifier authNotifier) async {
  FirebaseUser user = (await FirebaseAuth.instance.currentUser());

  if(user != null)
    {
      authNotifier.setUser(user);
    }
}

Future<bool> login(String email, String password, AuthNotifier authNotifier) async {
  AuthResult authResult = (await FirebaseAuth.instance
      .signInWithEmailAndPassword(email: email, password: password)
      .catchError((onError) => print (onError.code))
  );

  if(authResult != null)
    {
      FirebaseUser firebaseUser = authResult.user;

      if(firebaseUser != null)
        {
          authNotifier.setUser(firebaseUser);

          return Future.value(true);

        }
    }

  return Future.value(false);
}

Future<bool> register(String fullname, String username, String password, String email, String age, String type) async{
  AuthResult authResult = await FirebaseAuth.instance
      .createUserWithEmailAndPassword(email: email, password: password)
      .catchError((onError) => print (onError.hashCode)
  );

  if(authResult != null)
    {
      UserUpdateInfo updateInfo = UserUpdateInfo();
      updateInfo.displayName = username;

      FirebaseUser firebaseUser = authResult.user;

      if(firebaseUser != null)
        {
          await firebaseUser.updateProfile(updateInfo);
          await firebaseUser.reload(); // é preciso para carregar os dados para o firebase


          registerUser(firebaseUser, fullname, age, type);
          return Future.value(true);
        }

    }

  return Future.value(false);

}

signout(AuthNotifier authNotifier) async {
  await FirebaseAuth.instance.signOut().catchError((error) => print(error.code));

  authNotifier.setUser(null);
}

resetPasswordWithEmail(String email){
  var auth = FirebaseAuth.instance;
  auth.sendPasswordResetEmail(email: email).catchError((e) {
    print(e.code);
    return e.code;
  });

  return "An email was sent to: " + email;

}