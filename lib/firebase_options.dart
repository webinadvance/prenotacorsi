// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyDuSDDrTxTH1JXmZzF-CZZIYsB4pK-aaEY',
    appId: '1:586633050644:web:be38d591d9e89fb26fc501',
    messagingSenderId: '586633050644',
    projectId: 'prenotacorsi-d69f6',
    authDomain: 'prenotacorsi-d69f6.firebaseapp.com',
    storageBucket: 'prenotacorsi-d69f6.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAu-Oe8DmkAFtEbCFVXllRHiW9t95wIZJw',
    appId: '1:586633050644:android:efc747823cc10fc56fc501',
    messagingSenderId: '586633050644',
    projectId: 'prenotacorsi-d69f6',
    storageBucket: 'prenotacorsi-d69f6.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBt9wOQtfi5X9SFcjzPc3rRm_ihzbp8q7g',
    appId: '1:586633050644:ios:88530a3b49bf9d236fc501',
    messagingSenderId: '586633050644',
    projectId: 'prenotacorsi-d69f6',
    storageBucket: 'prenotacorsi-d69f6.appspot.com',
    androidClientId: '586633050644-0brt8src6nauuo6dapjqn1ncq87p43rm.apps.googleusercontent.com',
    iosClientId: '586633050644-u75s741eeskclr3ugmrrqmbjprhqndof.apps.googleusercontent.com',
    iosBundleId: 'com.prenotacorsi.prenotacorsi',
  );
}
