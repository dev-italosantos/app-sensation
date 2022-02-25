import 'package:app_quiz/shared/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  FirebaseAuth _auth = FirebaseAuth.instance;

  UserModel? _userFromFirebaseUser(User user) {
    return user != null ? UserModel(uid: user.uid) : null;
  }

  Future signInEmailAndPassword(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      User? firebaseUser = userCredential.user;
      return _userFromFirebaseUser(firebaseUser!);
    } catch (erro) {
      print(erro.toString());
    }
  }

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (erro) {
      print(erro.toString());
      return null;
    }
  }
}
