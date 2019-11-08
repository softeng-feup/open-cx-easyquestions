import 'package:easyquestions/Objects/Registerform.dart';
import 'package:easyquestions/Objects/askForm.dart';
import 'package:easyquestions/Objects/loginForm.dart';
import 'package:flutter/material.dart';
import '../Objects/image_banner.dart';



class AskPage extends StatefulWidget{
  @override
  _AskPageState createState() => new _AskPageState();
}

class _AskPageState extends State<AskPage>
{

  @override
  Widget build(BuildContext context)
  {
    return new Scaffold(
        backgroundColor: Colors.white,
        body: new Stack(
          children: <Widget>[
            new ImageBanner("assets/images/login.png", MediaQuery.of(context).size.height),
            new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,

              children: <Widget>[
                new AskCard(),
              ],
            )


          ],
        )

    );
  }
}