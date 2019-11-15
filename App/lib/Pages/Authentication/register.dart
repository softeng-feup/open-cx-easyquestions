import 'package:app/API/db_authentication.dart';
import 'package:app/Notifiers/notifier_auth.dart';
import 'package:flutter/material.dart';
import 'package:app/Components/image_banner.dart';
import 'package:provider/provider.dart';
import 'package:app/Model/user.dart';


class Register extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return RegisterState();
  }
}

class RegisterState extends State<Register>
{
  final _regFormKey = GlobalKey<FormState>();
  User user = User();

  @override
  void initState() {
  AuthNotifier authNotifier = Provider.of<AuthNotifier>(context, listen: false);
  initializeCurrentUser(authNotifier);
  super.initState();
  }

  @override
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
                        key: _regFormKey,
                        child: Column(
                          children: <Widget>[
                            TextFormField(
                              validator: (input) {
                                if(input.isEmpty){
                                  return 'Provide a valid name please'; //TODO: verification with regex -> no numbers
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  labelText: 'Name'
                              ),
                              onSaved: (input) => user.name = input,
                            ),
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
                              onSaved: (input) => user.email = input,
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
                              onSaved: (input) => user.password = input,
                              obscureText: true,
                            ),
                            RaisedButton(
                              onPressed: submitForm,
                              child: Text('Submit'),
                            ),
                            RaisedButton(
                              onPressed: ()
                              {
                                Navigator.pop(context,);
                              },
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

  submitForm(){
    if (!_regFormKey.currentState.validate()) {
      return;
    }
    _regFormKey.currentState.save();

    AuthNotifier authNotifier = Provider.of<AuthNotifier>(context, listen: false);
    register(user, authNotifier);
  }
}