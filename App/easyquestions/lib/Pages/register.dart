import 'package:easyquestions/Objects/Registerform.dart';
import 'package:easyquestions/Objects/loginForm.dart';
import 'package:flutter/material.dart';
import '../Objects/image_banner.dart';



class RegisterPage extends StatefulWidget{
  @override
  _RegisterPageState createState() => new _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage>
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
                new RegisterCard(),
              ],
            )


          ],
        )

    );
  }
}