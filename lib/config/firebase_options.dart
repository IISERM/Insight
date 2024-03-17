import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDu0mNbx82vi5POU5ZHoI8NBIOBwP1sHfw',
    appId: '1:336710432752:web:f5140be7d780c840488f35',
    messagingSenderId: '336710432752',
    projectId: 'insight-turing',
    authDomain: 'insight-turing.firebaseapp.com',
    storageBucket: 'insight-turing.appspot.com',
    measurementId: 'G-5HZ3PN6J6L',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCu5pswIlxZAJxonjNABEO0377mFraZYvM',
    appId: '1:336710432752:android:9be908401741c5fa488f35',
    messagingSenderId: '336710432752',
    projectId: 'insight-turing',
    storageBucket: 'insight-turing.appspot.com',
    androidClientId: 'http://336710432752-981dj9ihjtaj84d86529gls5i6k40jbu.apps.googleusercontent.com/'
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBq6kSLenW8D17wazXnPJ7rP5kgBTLvjkw',
    appId: '1:336710432752:ios:ff1228b72e89dbdc488f35',
    messagingSenderId: '336710432752',
    projectId: 'insight-turing',
    storageBucket: 'insight-turing.appspot.com',
    androidClientId:
        '336710432752-a0sgle6387ja6k3f8iuvbk39gk6b9jus.apps.googleusercontent.com',
    iosClientId:
        '336710432752-qk9urgik9pq6ga41dgf5gvb500a18ju7.apps.googleusercontent.com',
    iosBundleId: 'club.turing.iiserm.insight',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBq6kSLenW8D17wazXnPJ7rP5kgBTLvjkw',
    appId: '1:336710432752:ios:e327ccbfa363db2a488f35',
    messagingSenderId: '336710432752',
    projectId: 'insight-turing',
    storageBucket: 'insight-turing.appspot.com',
    androidClientId:
        '336710432752-a0sgle6387ja6k3f8iuvbk39gk6b9jus.apps.googleusercontent.com',
    iosClientId:
        '336710432752-sofdrela03a9n2ttvge017l3br2nvn39.apps.googleusercontent.com',
    iosBundleId: 'club.turing.iiserm.insight.RunnerTests',
  );
}
