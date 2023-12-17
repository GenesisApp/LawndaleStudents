import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAtyw9AmbbdhJ18irzW6gRzF1SXKl5zvsg",
            authDomain: "definition-youth.firebaseapp.com",
            projectId: "definition-youth",
            storageBucket: "definition-youth.appspot.com",
            messagingSenderId: "339432910546",
            appId: "1:339432910546:web:7f236d759114872928470b",
            measurementId: "G-0MLXG4JQ52"));
  } else {
    await Firebase.initializeApp();
  }
}
