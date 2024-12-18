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
    apiKey: 'AIzaSyC-j184Vk2ggXmwp4Smekc7pC51uZdbfoA',
    appId: '1:300644297532:web:9194290126cba97fa94c39',
    messagingSenderId: '300644297532',
    projectId: 'hosteloutpassapp-48cd8',
    authDomain: 'hosteloutpassapp-48cd8.firebaseapp.com',
    storageBucket: 'hosteloutpassapp-48cd8.firebasestorage.app',
    measurementId: 'G-XSKQWE8ZCC',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDBvZZJhvt1K9pvS1XDfXLyD7r2g-u44k0',
    appId: '1:300644297532:android:51d4629b1813cc15a94c39',
    messagingSenderId: '300644297532',
    projectId: 'hosteloutpassapp-48cd8',
    storageBucket: 'hosteloutpassapp-48cd8.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDtvwlVBeUXpzrlrP6oHa4PQ48yt6h_fhM',
    appId: '1:300644297532:ios:4e99207a95a2c761a94c39',
    messagingSenderId: '300644297532',
    projectId: 'hosteloutpassapp-48cd8',
    storageBucket: 'hosteloutpassapp-48cd8.firebasestorage.app',
    iosBundleId: 'com.example.hostelOutpassApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDtvwlVBeUXpzrlrP6oHa4PQ48yt6h_fhM',
    appId: '1:300644297532:ios:4e99207a95a2c761a94c39',
    messagingSenderId: '300644297532',
    projectId: 'hosteloutpassapp-48cd8',
    storageBucket: 'hosteloutpassapp-48cd8.firebasestorage.app',
    iosBundleId: 'com.example.hostelOutpassApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyC-j184Vk2ggXmwp4Smekc7pC51uZdbfoA',
    appId: '1:300644297532:web:208295faffe00875a94c39',
    messagingSenderId: '300644297532',
    projectId: 'hosteloutpassapp-48cd8',
    authDomain: 'hosteloutpassapp-48cd8.firebaseapp.com',
    storageBucket: 'hosteloutpassapp-48cd8.firebasestorage.app',
    measurementId: 'G-1S4WN0CMG4',
  );

}