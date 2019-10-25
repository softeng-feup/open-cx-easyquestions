import 'package:flutter/material.dart';

class button extends StatelessWidget{
  final String _name;
  final String _nextPage;

  button(this._name, this._nextPage);

  @override
  Widget build(BuildContext context) {
    return new ButtonTheme(
        minWidth: double.infinity,

        child: RaisedButton(
          padding: const EdgeInsets.fromLTRB(5.0, 4.0, 5.0, 4.0),
          textColor: Colors.white,
          color: Colors.blue,
          onPressed: () {},
          child: new Text(_name),
        )
    );
  }
}