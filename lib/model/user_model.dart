class UserModel {
  int? userId;
  String? nameSurname;
  String? username;
  String? profilePictureUrl;

  UserModel(
      {this.userId, this.nameSurname, this.username, this.profilePictureUrl});

  UserModel.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    nameSurname = json['nameSurname'];
    username = json['username'];
    profilePictureUrl = json['profilePictureUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['nameSurname'] = this.nameSurname;
    data['username'] = this.username;
    data['profilePictureUrl'] = this.profilePictureUrl;
    return data;
  }
}