import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

noDataToShow() {
  return
  Padding(
    padding: EdgeInsets.only(left: 90),
      child:
      Column(
          mainAxisAlignment: MainAxisAlignment.center,
         children: <Widget>[
            Text("Ups! There is nothing to display.\nReload please.", style: TextStyle(
            fontSize: 16.0,
            color: Colors.black54,
          ),textAlign: TextAlign.center,),
           SizedBox(height: 10,),
           Icon(Icons.error),
        ]
      )
    );
}

String noEmptyFields(input){
  if(input.isEmpty)
    return "No empty fields, please!";
  else
    return null;
}

String longerPassword(input){
  if(input.length < 6){ //TODO: verification with regex + encryption
    return 'Longer password please';
  }
  return null;
}

validateAge(input){
  int number = int.tryParse(input);
  if(number != null) {
    if (number < 18 || number > 100)
      return "Please, insert a valid age [18 - 100]";
  }

  if(number == null){
    return "Please, insert a numeric value.";
  }
}
void showWarning(String warning, BuildContext context){

  var alertDialog = AlertDialog(
    title: Text(warning.toString(), style: TextStyle(
      fontSize: 12.0,
      color: Colors.black54,
      ),
    textAlign: TextAlign.center,),
  );

  showDialog(context: context,
  builder: (BuildContext context) {
    return alertDialog;
  });
}
