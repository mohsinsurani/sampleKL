import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCHXQywiKQi41XTzpq-QIzhF-IwLPO6swQ",
            authDomain: "samplekl.firebaseapp.com",
            projectId: "samplekl",
            storageBucket: "samplekl.appspot.com",
            messagingSenderId: "38156967362",
            appId: "1:38156967362:web:87644ca5f8e10e3bbf0a5b",
            measurementId: "G-BRCM06GBT5"));
  } else {
    await Firebase.initializeApp();
  }
}
