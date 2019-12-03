import 'package:app/Model/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:app/Notifiers/notifier_auth.dart';


initializeCurrentUser(AuthNotifier authNotifier) async {
  FirebaseUser user = (await FirebaseAuth.instance.currentUser());

  if(user != null)
    {
      authNotifier.setUser(user);
    }
}

login(User user, AuthNotifier authNotifier) async {
  AuthResult authResult = (await FirebaseAuth.instance
      .signInWithEmailAndPassword(email: user.email, password: user.password)
      .catchError((onError) => print (onError.code))
  );

  if(authResult != null)
    {
      FirebaseUser firebaseUser = authResult.user;

      if(firebaseUser != null)
        {
          authNotifier.setUser(firebaseUser);
        }
    }
}

register(User user, AuthNotifier authNotifier) async{
  AuthResult authResult = await FirebaseAuth.instance
      .createUserWithEmailAndPassword(email: user.email, password: user.password)
      .catchError((onError) => print (onError.hashCode)
  );

  if(authResult != null)
    {
      UserUpdateInfo updateInfo = UserUpdateInfo();
      updateInfo.displayName = user.name;

      FirebaseUser firebaseUser = authResult.user;

      if(firebaseUser != null)
        {
          await firebaseUser.updateProfile(updateInfo);
          await firebaseUser.reload(); // é preciso para carregar os dados para o firebase

          FirebaseUser currentUser = await FirebaseAuth.instance.currentUser();
          authNotifier.setUser(currentUser);
        }

    }
}

signout(AuthNotifier authNotifier) async {
  await FirebaseAuth.instance.signOut().catchError((error) => print(error.code));

  authNotifier.setUser(null);
}