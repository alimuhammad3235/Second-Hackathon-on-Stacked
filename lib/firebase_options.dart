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
    apiKey: 'AIzaSyBrDb5SSUqSmG7lAxD03RB7FB39I0TXVIM',
    appId: '1:394781399181:web:e3628344daab1fd28feac4',
    messagingSenderId: '394781399181',
    projectId: 'rolebased-4a95f',
    authDomain: 'rolebased-4a95f.firebaseapp.com',
    storageBucket: 'rolebased-4a95f.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDkwsIHsQtu-nXeyjSo38-9K3S5eYr7MgI',
    appId: '1:394781399181:android:d514f5f89910d27d8feac4',
    messagingSenderId: '394781399181',
    projectId: 'rolebased-4a95f',
    storageBucket: 'rolebased-4a95f.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCmVjsfplvBgAeqkL9DeegY1obVM6a8kfg',
    appId: '1:394781399181:ios:9831ef2d287bbf798feac4',
    messagingSenderId: '394781399181',
    projectId: 'rolebased-4a95f',
    storageBucket: 'rolebased-4a95f.appspot.com',
    iosClientId: '394781399181-sgjnmqmkumnfhkeh3erjdrl7kf4cli35.apps.googleusercontent.com',
    iosBundleId: 'com.example.emerapp',
  );
}
