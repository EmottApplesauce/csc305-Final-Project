import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBV7yCoJkBvJDJla5wHHFdjYjFZnknQxDI",
            authDomain: "csc305-finalproject-ug9p6j.firebaseapp.com",
            projectId: "csc305-finalproject-ug9p6j",
            storageBucket: "csc305-finalproject-ug9p6j.firebasestorage.app",
            messagingSenderId: "966716708052",
            appId: "1:966716708052:web:0fb1f74ff6b1faa86c9741",
            measurementId: "G-9S526CW8R7"));
  } else {
    await Firebase.initializeApp();
  }
}
