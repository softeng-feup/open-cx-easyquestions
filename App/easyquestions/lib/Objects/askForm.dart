import 'package:easyquestions/Objects/button.dart';
import 'package:flutter/material.dart';

class AskCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Stack(
        children: <Widget>[
          new Container(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),

          ),

          new Container(
            width: double.infinity,
            height: 350,
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.8),
                //borderRadius: BorderRadius.circular(8.0),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black12,
                      offset: Offset(0.0, 15.0),
                      blurRadius: 15.0),
                  BoxShadow(
                      color: Colors.black12,
                      offset: Offset(0.0, -10.0),
                      blurRadius: 10.0),
                ]
            ),

            child: Padding(
              padding: EdgeInsets.only(left: 16.0, right: 16.0, top:16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Question",
                      style: TextStyle(
                        fontFamily: "Poppins-Medium",
                        fontWeight: FontWeight.bold,
                        fontSize: 23,
                      )),
                  TextField(
                    decoration: InputDecoration(
                        hintText: "Question",
                        hintStyle: TextStyle(color: Colors.black54, fontSize: 12.0)),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  button("ENTER", ""),
                ],
              ),
            ),
          ),
        ]);

  }
}