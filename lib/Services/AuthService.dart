import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

class Auth extends ChangeNotifier{
  bool _isLoggedIn = false;
  bool get isLoggedIn => _isLoggedIn;
  void login() {
    _isLoggedIn = true;
    notifyListeners();
  }
  void logout() {
    _isLoggedIn = false;
    notifyListeners();
  }
  final user = FirebaseAuth.instance.currentUser;
  String? kulanici;
  final firebaseAuth=FirebaseAuth.instance;
  final FirebaseFirestore _firestore=FirebaseFirestore.instance;
  Future<User?> signInAnonymously()async{
    final userCredentials= await firebaseAuth.signInAnonymously();
    kulanici=userCredentials.user!.uid;
    return userCredentials.user;
  }

  Future<User?> createUserWithEmailAndPassword(
      String email, String password) async {
    final userCredentials = await firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
    kulanici=userCredentials.user!.uid;
    return userCredentials.user;
  }
  Future<User?> signInWithEmailAndPassword(String email, String password) async {
    final userCredentials = await firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
    kulanici=userCredentials.user!.uid;

    return userCredentials.user;
  }
  Future<User?> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    // Obtain the auth details from the request
    if (googleUser !=null) {
      final GoogleSignInAuthentication? googleAuth = await googleUser
          .authentication;
      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      // Once signed in, return the UserCredential
      UserCredential userCredential = await firebaseAuth.signInWithCredential(
          credential);
      return userCredential.user;
    }
    return null;
  }
  Future<void> signOut() async {
    await firebaseAuth.signOut();
  }
  Stream<User?> authStatus() {
    return firebaseAuth.authStateChanges();
  }

}

