import 'package:firebase_auth/firebase_auth.dart';

abstract class Authbase {
  Future<User?> loginWithEmailAndPassword(String email, String password);
  Future<User?> signUpWithEmailAndPassword(String email, String password);
  User? get currentUser;
  Stream<User?> authstateChanges();
  Future<void> signOut();
}

class Auth implements Authbase {
  final _firebaseAuth = FirebaseAuth.instance;
  @override
  Future<User?> loginWithEmailAndPassword(String email, String password) async {
    final userAuth = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
    return userAuth.user;
  }

  @override
  Future<User?> signUpWithEmailAndPassword(
      String email, String password) async {
    final userAuth = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);

    return userAuth.user; //ال user لم تظهر الا لما عملنا async and await
  }

  @override
  Stream<User?> authstateChanges() {
    return _firebaseAuth.authStateChanges();
  }

  @override
  // TODO: implement currentUser
  User? get currentUser => _firebaseAuth.currentUser;

  @override
  Future<void> signOut() async {
    try {
      await _firebaseAuth.signOut();
    } catch (e) {
      rethrow;
    }
  }
}
