import 'package:flutter/foundation.dart';
import "package:flutter/material.dart";
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hive/hive.dart';
import 'package:insight/commons/models/hive_objects/insight_user_object.dart';
import 'package:insight/commons/models/hive_objects/student.dart';

class Authentication {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Stream<User?> get authStateChange => _auth.authStateChanges();

  Future<void> signOut() async {
    await _auth.signOut();
  }

  Future<void> signInWithGoogle(BuildContext context) async {
    final studentBox = await Hive.openBox<Student>("student_box");

    if (kIsWeb) {
      // Create a new provider
      GoogleAuthProvider googleProvider = GoogleAuthProvider();
      // Once signed in, return the UserCredential
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithPopup(googleProvider);
      User? user = userCredential.user;

      InsightUser insightUser = InsightUser()
        ..accessToken = userCredential.credential?.accessToken
        ..refreshToken = user?.refreshToken
        ..token = userCredential.credential?.token as String?
        ..secret = null
        ..idToken = null;

      Student student = Student()
        ..insightUser = insightUser
        ..name = user?.displayName!
        ..isSubscribedToSRM = true
        ..photoURL = user?.photoURL
        ..registrationNumber =
            user?.email?.substring(0, user.email!.length - 18)
        ..settings = null;

      studentBox.put(student.registrationNumber, student);
    } else {
      final GoogleSignInAccount? googleUser = await GoogleSignIn(
              clientId:
                  "http://336710432752-981dj9ihjtaj84d86529gls5i6k40jbu.apps.googleusercontent.com/")
          .signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;
      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      //TODO: Use Hive to store this data in the user's device

      try {
        await _auth.signInWithCredential(credential);
      } on FirebaseAuthException catch (exception) {
        //TODO: Report and handle exception
      }

      // Or use signInWithRedirect
      // return await FirebaseAuth.instance.signInWithRedirect(googleProvider);
    }
  }
}
