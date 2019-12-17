import 'package:app/API/db_authentication.dart';
import 'package:app/Pages/talk_feed.dart';
import 'package:app/Pages/user_profile.dart';
import 'package:flutter/material.dart';

Widget loggedin_topBar(authNotifier, context, isTalksFeed){
  return AppBar(
    title: Text(
        authNotifier.firebaseUser != null ? authNotifier.firebaseUser.displayName : "Error!"
    ),
    actions: <Widget>[
      IconButton(
        onPressed: () {  Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){return TalksFeed();}));},
        icon: Icon(Icons.library_books),
      ),
      IconButton(
        onPressed: () {  Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){return Profile();}));},
        icon: Icon(Icons.person),
      ),
      IconButton(
        onPressed: () { signout(authNotifier);  Navigator.popUntil(context, ModalRoute.withName(Navigator.defaultRouteName)); },
        icon: Icon(Icons.power_settings_new),
      ),

    ],
    automaticallyImplyLeading: isTalksFeed ? false : true,
  );
}