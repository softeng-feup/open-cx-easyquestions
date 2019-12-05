import 'package:app/API/db_authentication.dart';
import 'package:flutter/material.dart';

Widget loggedin_topBar(authNotifier, context){
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
}