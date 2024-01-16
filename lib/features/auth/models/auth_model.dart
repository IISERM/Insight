import "package:flutter/material.dart";
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Authentication {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Stream<User?> get authStateChange => _auth.authStateChanges();

  Future<void> signInWithGoogle(BuildContext context) async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn(clientId: "http://336710432752-981dj9ihjtaj84d86529gls5i6k40jbu.apps.googleusercontent.com/").signInSilently();
    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;
    final OAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    print(credential);

    //TODO: Use SharedPreferences to store this data in the user's device

    try {
      await _auth.signInWithCredential(credential);
    } on FirebaseAuthException catch (exception) {
      //TODO: Report and handle exception
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}
