import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  static final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<bool> register(String email, String password) async {
    bool isDone = false;
    try {
      isDone = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) async {
        return await value != null ? true : false;
      });
    } on FirebaseException catch (e) {
      print(e.toString());
    }
    return isDone;
  }

  Future<bool> logIn(String email, String password) async {
    bool isDone = false;
    try {
      isDone = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) async {
        print('giriş yapıldı');
        return await value != null ? true : false;
      });
    } on FirebaseException catch (e) {
      print(e.toString());
    }
    return isDone;
  }
}
