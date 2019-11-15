class Answer {
  String body;
//  DateTime _dateTime;

  Answer.fromMap(Map<String, dynamic> data) {
    body = data['Body'];
  }
}