import 'package:flutter/cupertino.dart';

noDataToShow() {
  return Container(
    child: Text("Ups! There are no questions to display!"),
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