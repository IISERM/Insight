import 'package:flutter/foundation.dart';
import "package:flutter/material.dart";
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hive/hive.dart';
import 'package:insight/commons/models/hive_objects/insight_user_object.dart';
import 'package:insight/commons/models/hive_objects/student.dart';
import 'package:insight/commons/widgets/error_handlers.dart';

class Authentication {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Stream<User?> get authStateChange => _auth.authStateChanges();

  // Sign out method
  Future<void> signOut() async {
    await _auth.signOut();
  }

  Future<void> signInWithGoogle(BuildContext context) async {
    if (kIsWeb) {
      // Create a new provider
      GoogleAuthProvider googleProvider = GoogleAuthProvider();
      // Once signed in, return the UserCredential
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithPopup(googleProvider);
      User? user = userCredential.user;

      storeStudent(
          accessToken: userCredential.credential?.accessToken,
          refreshToken: user?.refreshToken,
          token: userCredential.credential?.token as String?,
          displayName: user!.displayName!,
          photoURL: user.photoURL!,
          email: user.email!);
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
      storeStudent(
          displayName: googleUser.displayName!,
          photoURL: googleUser.photoUrl!,
          email: googleUser.email,
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken

          );

      try {
        await _auth.signInWithCredential(credential);
      } on FirebaseAuthException catch (exception) {
        ErrorDialogue(exception);
      }

      // Or use signInWithRedirect
      // return await FirebaseAuth.instance.signInWithRedirect(googleProvider);
    }
  }

  Future<void> storeStudent(
      {String? accessToken,
      String? refreshToken,
      String? token,
      String? secret,
      String? idToken,
      required String displayName,
      required String photoURL,
      required String email}) async {
    final studentBox = await Hive.openBox<Student>("student_box");
    InsightUser insightUser = InsightUser()
      ..accessToken = accessToken
      ..refreshToken = refreshToken
      ..token = token
      ..secret = secret
      ..idToken = idToken;

    Student student = Student()
      ..insightUser = insightUser
      ..name = displayName
      ..isSubscribedToSRM = true
      ..photoURL = photoURL
      ..registrationNumber = email.substring(0, email.length - 18)
      ..settings = null;

    studentBox.put(student.registrationNumber, student);
  }
}
