class UserProfile{
  User _user;
  String id;
  String email;
  String image;
  String description;
  UserProfile({this.email, this.image, this.description});

  set setUser(User user){
    _user = user;
  }

  User get user => _user;

  UserProfile.register(this.email);


  UserProfile.fromMap(Map<String, dynamic> data) {
    id =data['id'];
    email = data['email'];
    image = data['image'];
    description = data['description'];
  }
  Map<String, dynamic> toMap() {
    return {
      'email' : email,
      'image': image,
      'description' : description
    };
  }

}

class User {
  String name;
  String password;
  String email;

  User();

}

class Participant extends User {

}

class Speaker extends User {

}