
class User {
  String authID; //related to firebase user
  String idDoc;

  int permission;
  String avatar;
  String fullname;
  String age;
  String description;

  User({this.permission, this.avatar, this.fullname, this.age, this.description, this.authID});


  User.fromJson(Map<String, dynamic> json) {
    fullname = json['fullname'];
  }

  User.fromMap(Map<dynamic, dynamic> data) {
    idDoc = data['idDoc'];
    authID = data['AuthID'];
    fullname = data['Fullname'];
    avatar = data['Avatar'];
    age = data['Age'];
    description = data['Description'];
    permission = data['Permission'];
  }

  Map<String, dynamic> toMap(){
    return {
      'idDoc' : idDoc,
      'Fullname' : fullname,
      'Description' : description,
      'AuthID' : authID,
      'Avatar' : avatar,
      'Age' : age,
      'Permission': permission
    };
  }
}

