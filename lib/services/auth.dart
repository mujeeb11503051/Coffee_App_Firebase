import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_coffee_app/models/user.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // create user obj based on FirebaseUser

  Userr? _fromFirebaseUser(User? user)
  {
  return user != null ? Userr(uid: user.uid) : null;
  }

  // sign in anon
  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return _fromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // sing in with email and password

  // register with email and password

  // sign out
}
