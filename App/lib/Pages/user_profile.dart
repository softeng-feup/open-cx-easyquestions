import 'dart:io';

import 'package:app/API/db_user.dart';
import 'package:app/Model/user.dart';
import 'package:app/Notifiers/notifier_auth.dart';
import 'package:flutter/material.dart';
import 'package:app/Components/loggedin_topbar.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';


class Profile extends StatefulWidget {
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AuthNotifier authNotifier;
  String _imageUrl;
  File _imageFile;
  User _userProfile;
  bool _isUpdating;
  TextEditingController descController;
  @override
  void initState() {
    authNotifier = Provider.of<AuthNotifier>(context, listen: false);
    _userProfile = authNotifier.user;
    _imageUrl = _userProfile.avatar;
    _isUpdating = false;
    descController = new TextEditingController();
    super.initState();
  }


  _showImage() {
    if (_imageFile == null && _imageUrl == null) {
      return Container(
        decoration: BoxDecoration(color: Colors.white),
      );
    } else if (_imageFile != null) {
      print('showing image from local file');

      return Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: <Widget>[
          Image.file(
            _imageFile,
            fit: BoxFit.cover,
            height: 250,
          ),
          FlatButton(
            padding: EdgeInsets.all(16),
            color: Colors.black54,
            child: Text(
              'Change Image',
              style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w400),
            ),
            onPressed: () => _getLocalImage(),
          )
        ],
      );
    } else if (_imageUrl != null) {
      print('showing image from url');

      return Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: <Widget>[
          Image.network(
            _imageUrl,
            fit: BoxFit.cover,
            height: 250,
          ),
          FlatButton(
            padding: EdgeInsets.all(16),
            color: Colors.black54,
            child: Text(
              'Change Image',
              style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w400),
            ),
            onPressed: () => _getLocalImage(),
          )
        ],
      );
    }
  }

  _getLocalImage() async {
    File imageFile =
    await ImagePicker.pickImage(source: ImageSource.gallery, maxWidth: 400);

    if (imageFile != null) {
      setState(() {
        _imageFile = imageFile;
        _isUpdating = true;
      });
    }
  }

  Widget _buildDescriptionField() {
    descController.text = _userProfile.description;
    return TextFormField(
      decoration: InputDecoration(labelText: 'Description'),
      keyboardType: TextInputType.text,
      style: TextStyle(fontSize: 20),
      controller: descController,
    );
  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: loggedin_topBar(authNotifier, context),
        body: new Container(
          color: Colors.white,
          child: new ListView(
            children: <Widget>[
              Column(
                children: <Widget>[
                  new Container(
                    color: Color(0xffFFFFFF),
                    child: Padding(
                      padding: EdgeInsets.only(left: 25.0),
                      child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          _showImage(),
                          SizedBox(height: 16),
                          _imageFile == null && _imageUrl == null
                              ? ButtonTheme(
                            child: RaisedButton(
                              onPressed: () => _getLocalImage(),
                              child: Text(
                                'Add Image',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          )
                              : SizedBox(height: 0),
                          Padding(
                              padding: EdgeInsets.only(
                                  left: 25.0, right: 25.0, top: 25.0),
                              child: new Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  new Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      new Text(
                                        'Name',
                                        style: TextStyle(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ],
                              )),
                          Padding(
                              padding: EdgeInsets.only(
                                  left: 25.0, right: 25.0, top: 2.0),
                              child: new Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  new Flexible(
                                    child: new Text(
                                      authNotifier.firebaseUser.displayName,
                                      style: TextStyle(
                                          fontSize: 12.0),
                                    ),
                                  ),
                                ],
                              )),
                          Padding(
                              padding: EdgeInsets.only(
                                  left: 25.0, right: 25.0, top: 25.0),
                              child: new Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  new Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      new Text(
                                        'Email ID',
                                        style: TextStyle(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ],
                              )),
                          Padding(
                              padding: EdgeInsets.only(
                                  left: 25.0, right: 25.0, top: 2.0),
                              child: new Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  new Flexible(
                                    child: new Text(
                                      authNotifier.firebaseUser.email,
                                      style: TextStyle(
                                          fontSize: 12.0),
                                    ),
                                  ),
                                ],
                              )),
                          Padding(
                              padding: EdgeInsets.only(
                                  left: 25.0, right: 25.0, top: 25.0),
                              child: new Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  new Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      new Text(
                                        'Age',
                                        style: TextStyle(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ],
                              )),
                          Padding(
                              padding: EdgeInsets.only(
                                  left: 25.0, right: 25.0, top: 2.0),
                              child: new Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  new Flexible(
                                    child: new Text(
                                      _userProfile.age,
                                      style: TextStyle(
                                          fontSize: 12.0),
                                    ),
                                  ),
                                ],
                              )),
                          Padding(
                              padding: EdgeInsets.only(
                                  left: 25.0, right: 25.0, top: 2.0),
                              child: _buildDescriptionField()
                          ),
                          Padding(
                              padding: EdgeInsets.only(
                                  left: 25.0, right: 25.0, top: 2.0),
                              child: RaisedButton(
                                onPressed: submitForm,
                                child: Text('Submit'),
                              ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ));
  }


  submitForm(){
    _userProfile.description = descController.text;
    updateUser(_userProfile, _imageFile);
    Navigator.pop(context, );
  }
}