class User {
  int? userId;
  String? nameSurname;
  String? username;
  String? profilePictureUrl;
  String? email;

  User(
      {this.userId,
      this.nameSurname,
      this.username,
      this.profilePictureUrl,
      this.email});

  User.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    nameSurname = json['nameSurname'];
    username = json['username'];
    profilePictureUrl = json['profilePictureUrl'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['userId'] = userId;
    data['nameSurname'] = nameSurname;
    data['username'] = username;
    data['profilePictureUrl'] = profilePictureUrl;
    data['email'] = email;
    return data;
  }
}
