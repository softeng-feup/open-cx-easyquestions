import 'package:app/API/db_review.dart';
import 'package:app/API/db_user.dart';
import 'package:app/Components/loggedin_topbar.dart';
import 'package:app/Notifiers/notifier_auth.dart';
import 'package:app/Notifiers/notifier_review.dart';
import 'package:flutter/material.dart';
import 'package:app/Components/image_banner.dart';
import 'package:app/Pages/Authentication/login.dart';
import 'package:app/Pages/Authentication/register.dart';
import 'package:provider/provider.dart';

class Welcome extends StatelessWidget{
  Widget build(BuildContext context) {

    ReviewNotifier reviewNotifier = Provider.of<ReviewNotifier>(context, listen: false);

    loadReviews_MDb(reviewNotifier);

    return Scaffold(
    body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ImageBanner(
              "assets/images/home.png",
              (MediaQuery.of(context).size.height) / 2.5
          ),
          Center(
            child: Container(
              margin: EdgeInsets.only(top: 50),
              child: Column(
                children: <Widget>[
                  Text(
                      "MON 23 - THU 26 MARCH",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                      )
                  ),
                  Text(
                    "< Programming >" + "\n 2020",
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 35,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    "\nThe 4th International Conference on the" +
                        "\n Art, Science, and Engineering of Programming \n",
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  RaisedButton(
                    padding: const EdgeInsets.fromLTRB(5.0, 4.0, 5.0, 4.0),
                    textColor: Colors.white,
                    color: Colors.blue,
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
                    },
                    child: new Text("LOGIN"),
                  ),
                  RaisedButton(
                    padding: const EdgeInsets.fromLTRB(5.0, 4.0, 5.0, 4.0),
                    textColor: Colors.white,
                    color: Colors.blue,
                    onPressed: () {
                     Navigator.push(context, MaterialPageRoute(builder: (context) => Register()));
                    },
                    child: new Text("REGISTER"),
                  )
                ],
              ),
            ),
          ),
        ]
    ),
      bottomNavigationBar:
    //Switch to feup's logo
      Text("by easy questions", style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 14,
      ),
    textAlign: TextAlign.center,),
    );
  }
}