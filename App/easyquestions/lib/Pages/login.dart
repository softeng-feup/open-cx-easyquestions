import 'package:easyquestions/Objects/loginForm.dart';
import 'package:flutter/material.dart';
import '../Objects/image_banner.dart';



class LoginPage extends StatefulWidget{
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
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
              new FormCard(),
            ],
          )


        ],
      )

    );
  }
}