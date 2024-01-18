import 'dart:ui';

import 'package:flutter/foundation.dart';
import "package:flutter/material.dart";
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hive/hive.dart';
import 'package:insight/commons/models/hive_objects/insight_user_object.dart';

class Authentication {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Stream<User?> get authStateChange => _auth.authStateChanges();


  Future<void> signInWithGoogle(BuildContext context) async {
    final userBox = await Hive.openBox<InsightUser>("user_box");


    if (kIsWeb) {
      // Create a new provider
      GoogleAuthProvider googleProvider = GoogleAuthProvider();
      // Once signed in, return the UserCredential
      UserCredential userCredential = await FirebaseAuth.instance.signInWithPopup(googleProvider);
      User? user = userCredential.user;

    } else {
      final GoogleSignInAccount? googleUser = await GoogleSignIn()
          .signIn();
      final GoogleSignInAuthentication googleAuth =
      await googleUser!.authentication;
      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      //TODO: Use SharedPreferences to store this data in the user's device

      try {
        await _auth.signInWithCredential(credential);
      } on FirebaseAuthException catch (exception) {
        //TODO: Report and handle exception
      }


      // Or use signInWithRedirect
      // return await FirebaseAuth.instance.signInWithRedirect(googleProvider);
    }


    Future<void> signOut() async {
      await _auth.signOut();
    }
  }
}
