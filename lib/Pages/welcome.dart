import 'package:flutter/material.dart';
import 'package:app/Components/image_banner.dart';
import 'package:app/Pages/Authentication/login.dart';
import 'package:app/Pages/Authentication/register.dart';

class Welcome extends StatelessWidget{
  Widget build(BuildContext context) {
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
      Text("@FEUP", style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
    textAlign: TextAlign.center,),
    );
  }
}