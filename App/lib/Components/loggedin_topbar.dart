import 'package:app/API/db_authentication.dart';
import 'package:flutter/material.dart';

Widget loggedin_topBar(authNotifier){
  return AppBar(
    title: Text(
      authNotifier.user != null ? authNotifier.user.displayName : "Feed",
    ),
    actions: <Widget>[
      FlatButton(
        onPressed: () => signout(authNotifier),
        child: Text(
          "Logout",
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    ],
  );
}