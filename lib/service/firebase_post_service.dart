import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dev_commit/constants/firebase_constants.dart';
import 'package:dev_commit/model/post_model.dart';

class FirebasePostService {
  static final FirebasePostService _service = FirebasePostService._internal();
  FirebasePostService._internal();
  factory FirebasePostService() => _service;

  Future<List<Post>> getPost() async {
    List<Post> posts = [];

    QuerySnapshot querySnapshot = await postsRef.get();

    for (DocumentSnapshot documentSnapshot in querySnapshot.docs) {
      Post oyuncuObje =
          Post.fromJson(documentSnapshot.data() as Map<String, dynamic>);
      posts.add(oyuncuObje);
    }

    return posts;
  }

  Future<bool> addPost(Post newPost) async {
    bool check = false;
    await postsRef.add(newPost.toJson()).then((value) async {
      value != null ? check = true : check = false;
    });
    return check;
  }
}
