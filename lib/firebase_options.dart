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

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBuFESzUcJgtNdXH1TbNOXmpxK3LxcRCa4',
    appId: '1:312954599679:ios:8dedc3978ed967abbfb4ca',
    messagingSenderId: '312954599679',
    projectId: 'spotify-deae7',
    storageBucket: 'spotify-deae7.appspot.com',
    iosBundleId: 'com.example.spotify',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCeCJalSRVuz6XO-ne63_UIkdVlf_R8kws',
    appId: '1:312954599679:web:49029839d0e5b737bfb4ca',
    messagingSenderId: '312954599679',
    projectId: 'spotify-deae7',
    authDomain: 'spotify-deae7.firebaseapp.com',
    storageBucket: 'spotify-deae7.appspot.com',
    measurementId: 'G-ZXQ5R4Q3YJ',
  );

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCeCJalSRVuz6XO-ne63_UIkdVlf_R8kws',
    appId: '1:312954599679:web:49029839d0e5b737bfb4ca',
    messagingSenderId: '312954599679',
    projectId: 'spotify-deae7',
    authDomain: 'spotify-deae7.firebaseapp.com',
    storageBucket: 'spotify-deae7.appspot.com',
    measurementId: 'G-ZXQ5R4Q3YJ',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBuFESzUcJgtNdXH1TbNOXmpxK3LxcRCa4',
    appId: '1:312954599679:ios:bab26739d0f16037bfb4ca',
    messagingSenderId: '312954599679',
    projectId: 'spotify-deae7',
    storageBucket: 'spotify-deae7.appspot.com',
    iosBundleId: 'com.example.spotify1',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA__asER80Nx7RJIA_OjrbwepEQ-8-yA1E',
    appId: '1:312954599679:android:593e2be3c17493b7bfb4ca',
    messagingSenderId: '312954599679',
    projectId: 'spotify-deae7',
    storageBucket: 'spotify-deae7.appspot.com',
  );

}