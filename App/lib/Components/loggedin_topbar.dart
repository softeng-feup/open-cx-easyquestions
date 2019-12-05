import 'package:app/API/db_authentication.dart';
import 'package:app/Pages/user_profile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/*Widget loggedin_topBar(authNotifier, context){
  return AppBar(
    title: Text(
      authNotifier.firebaseUser != null ? authNotifier.firebaseUser.displayName : "Error!"
    ),

    actions: <Widget>[
      FlatButton(
        onPressed: () { signout(authNotifier);  Navigator.popUntil(context, ModalRoute.withName(Navigator.defaultRouteName)); },
        child: Text(
          "Logout",
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    ],
  );
}*/

Widget loggedin_topBar(authNotifier, context){
  return AppBar(
    title: Text(
        authNotifier.firebaseUser != null ? authNotifier.firebaseUser.displayName : "Error!"
    ),
    actions: <Widget>[
      IconButton(
       onPressed: () {  Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){return Profile();}));},
        icon: Icon(Icons.person),
      ),
      IconButton(
        onPressed: () { signout(authNotifier);  Navigator.popUntil(context, ModalRoute.withName(Navigator.defaultRouteName)); },
        icon: Icon(Icons.power_settings_new),
        ),

    ],
  );
}