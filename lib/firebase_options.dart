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
        return macos;
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
    apiKey: 'AIzaSyCd695_K1rDdPGEwl2TsidzBkgO4I2Bi34',
    appId: '1:193799004335:web:cb74d502bac9a41f82f45a',
    messagingSenderId: '193799004335',
    projectId: 'fir-project-e397b',
    authDomain: 'fir-project-e397b.firebaseapp.com',
    storageBucket: 'fir-project-e397b.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBqpoYYPMdDRfOWZrIF6gB3tzv52CZgf-4',
    appId: '1:193799004335:android:5d89ad13d65a9b0882f45a',
    messagingSenderId: '193799004335',
    projectId: 'fir-project-e397b',
    storageBucket: 'fir-project-e397b.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDKJFFqfe6KT9UJiIzjMJRF_Pu7aXUwmmo',
    appId: '1:193799004335:ios:e61a240ba97b26ab82f45a',
    messagingSenderId: '193799004335',
    projectId: 'fir-project-e397b',
    storageBucket: 'fir-project-e397b.appspot.com',
    iosBundleId: 'com.example.flutterApplication1',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDKJFFqfe6KT9UJiIzjMJRF_Pu7aXUwmmo',
    appId: '1:193799004335:ios:e61a240ba97b26ab82f45a',
    messagingSenderId: '193799004335',
    projectId: 'fir-project-e397b',
    storageBucket: 'fir-project-e397b.appspot.com',
    iosBundleId: 'com.example.flutterApplication1',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCd695_K1rDdPGEwl2TsidzBkgO4I2Bi34',
    appId: '1:193799004335:web:c884bb1fe9ac2cbb82f45a',
    messagingSenderId: '193799004335',
    projectId: 'fir-project-e397b',
    authDomain: 'fir-project-e397b.firebaseapp.com',
    storageBucket: 'fir-project-e397b.appspot.com',
  );
}
