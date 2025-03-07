// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyBK8n7WFgf1-C_e4nHtxXANMuYcUSuXlzY',
    appId: '1:917762246775:web:44c122644f2be9a9075e72',
    messagingSenderId: '917762246775',
    projectId: 'fir-s-flutter',
    authDomain: 'fir-s-flutter.firebaseapp.com',
    storageBucket: 'fir-s-flutter.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBD8HIvYqtYCfZU1e50fCTqhNvaalIyGp4',
    appId: '1:917762246775:android:b06559bb77480052075e72',
    messagingSenderId: '917762246775',
    projectId: 'fir-s-flutter',
    storageBucket: 'fir-s-flutter.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC-k2WLjc_DqTvTditnto1tMEg93EeMRuY',
    appId: '1:917762246775:ios:2d6dca60415a11ce075e72',
    messagingSenderId: '917762246775',
    projectId: 'fir-s-flutter',
    storageBucket: 'fir-s-flutter.appspot.com',
    iosBundleId: 'com.trodev.firebasesFlutter',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBK8n7WFgf1-C_e4nHtxXANMuYcUSuXlzY',
    appId: '1:917762246775:web:d35471c0e7765a84075e72',
    messagingSenderId: '917762246775',
    projectId: 'fir-s-flutter',
    authDomain: 'fir-s-flutter.firebaseapp.com',
    storageBucket: 'fir-s-flutter.appspot.com',
  );
}
