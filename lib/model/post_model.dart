class Post {
  String? ownerId;
  int? postId;
  String? postTitle;

  Post({this.ownerId, this.postId, this.postTitle});

  Post.fromJson(Map<String, dynamic> json) {
    ownerId = json['ownerId'];
    postId = json['postId'];
    postTitle = json['postTitle'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['ownerId'] = ownerId;
    data['postId'] = postId;
    data['postTitle'] = postTitle;
    return data;
  }
}
