import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyD-tyBM03laVJazWLOQEp_iu4-WoP_tiY0",
            authDomain: "lawndale-students-jaiw48.firebaseapp.com",
            projectId: "lawndale-students-jaiw48",
            storageBucket: "lawndale-students-jaiw48.appspot.com",
            messagingSenderId: "536088823618",
            appId: "1:536088823618:web:db65424fef11d68234eadb"));
  } else {
    await Firebase.initializeApp();
  }
}
