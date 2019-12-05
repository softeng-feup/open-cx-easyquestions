
import 'package:app/Model/user.dart';
import 'package:app/Notifiers/notifier_auth.dart';
import 'package:app/API/db_authentication.dart';
import 'package:app/Pages/welcome.dart';
import 'package:flutter/material.dart';
import 'package:app/Components/image_banner.dart';
import 'package:provider/provider.dart';

import '../talk_feed.dart';

class Login extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _LoginState();
  }
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String email, password;


  @override
  void initState() {
    AuthNotifier authNotifier = Provider.of<AuthNotifier>(context, listen: false);
    //initializeCurrentUser(authNotifier);
    super.initState();
  }

  Widget build(BuildContext context) {

    return new Scaffold(
        backgroundColor: Colors.white,
        body: new Stack(
          children: <Widget>[
            ImageBanner("assets/images/login.png", MediaQuery.of(context).size.height),
            new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                width: double.infinity,
                    height: 350,
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.8),
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
                    child:
                    Form(
                        key: _formKey,
                        child: Column(
                          children: <Widget>[
                            TextFormField(
                              validator: (input) {
                                if(input.isEmpty){
                                  return 'Provide a valid email please'; //TODO: verification with regex
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  labelText: 'Email'
                              ),
                              onSaved: (input) => email = input,
                            ),
                            TextFormField(
                              validator: (input) {
                                if(input.length < 6){ //TODO: verification with regex + encryption
                                  return 'Longer password please';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  labelText: 'Password'
                              ),
                              onSaved: (input) => password = input,
                              obscureText: true,
                            ),
                            RaisedButton(
                              padding: const EdgeInsets.fromLTRB(5.0, 4.0, 5.0, 4.0),
                              textColor: Colors.white,
                              color: Colors.blue,
                              onPressed: submitForm,
                              child: Text('Submit'),
                            ),
                            RaisedButton(
                              padding: const EdgeInsets.fromLTRB(5.0, 4.0, 5.0, 4.0),
                              textColor: Colors.white,
                              color: Colors.blue,
                              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Welcome())) //Substituir com home
                              ,
                              child: Text('Back'),
                            ),
                          ],
                        )
                    )
                )
              ],
            )
          ],
        )
    );
  }

  submitForm() async{
    if (!_formKey.currentState.validate()) {
      return;
    }
    _formKey.currentState.save();

    AuthNotifier authNotifier = Provider.of<AuthNotifier>(context, listen: false);

    if( await(login(email, password, authNotifier)) == true ) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => TalksFeed()));
    }
    else {
      //TODO : mensagem de login errado
    }

  }
}