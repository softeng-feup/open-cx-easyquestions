class Answer {
  String body;
//  DateTime _dateTime;

  Answer({this.body});

  Answer.fromMap(Map<String, dynamic> data) {
    body = data['Body'];
  }
}