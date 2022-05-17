import 'package:dev_commit/constants/firebase_constants.dart';
import '../model/user_model.dart';

class FirebasUserService {
  static final FirebasUserService _service = FirebasUserService._internal();
  FirebasUserService._internal();
  factory FirebasUserService() => _service;

  Future<bool> addUser(User newUser) async {
    bool check = false;
    await userRef.add(newUser.toJson()).then((value) async {
      userRef
          .doc(newUser.userId)
          .set(newUser.toJson())
          .whenComplete(() => print("heble"));
      value != null ? check = true : check = false;
    });

    return check;
  }
}
