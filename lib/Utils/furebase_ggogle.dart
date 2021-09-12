import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Authentication with ChangeNotifier {
  final GoogleSignIn googleSignIn = GoogleSignIn();
  bool _isSigningIn;

  Authentication() {
    _isSigningIn = false;
  }

  // User user;

  bool get isSigningIn => _isSigningIn;

  set isSigningIn(bool isSigningIn) {
    _isSigningIn = isSigningIn;
    notifyListeners();
  }

  Future signInWithGoogle() async {
    isSigningIn = true;
    final user = await googleSignIn.signIn();
    // print(isSigningIn);
    if (user == null) {
      isSigningIn = false;
    } else {
      final googleAuth = await user.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await FirebaseAuth.instance.signInWithCredential(credential);
      isSigningIn = false;
    }
  }

  void signOutGoogle() async {
    await googleSignIn.disconnect();
    await FirebaseAuth.instance.signOut();

    print("User Sign Out");
  }
}

// import 'dart:html';

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:google_sign_in/google_sign_in.dart';

// class Authentication {
//   // static Future<FirebaseApp> initializeFirebase() async {
//   //   FirebaseApp firebaseApp = await Firebase.initializeApp();

//   //   // TODO: Add auto login logic

//   //   return firebaseApp;
//   // }

// // final FirebaseAuth _auth = FirebaseAuth.instance;
//   final GoogleSignIn _googleSignIn = GoogleSignIn();
//   bool _isSigningIn;
// // final bool isSignedIn = false;

//   Authentication() {
//     _isSigningIn = false;
//   }

//   // User user;
//   bool get isSigningIn => _isSigningIn;

//   set isSigningIn(bool isSigningIn) {
//     _isSigningIn = isSigningIn;
//   }

//   Future signInWithGoogle() async {
//     isSigningIn = true;
//     final user = await _googleSignIn.signIn();

//     if (user == null) {
//       isSigningIn = false;
//     } else {
//       final googleAuth = await user.authentication;
//       final credential = GoogleAuthProvider.credential(
//         accessToken: googleAuth.accessToken,
//         idToken: googleAuth.idToken,
//       );
//       // final UserCredential authResult =
//       await FirebaseAuth.instance.signInWithCredential(credential);
//       isSigningIn = false;
//       // final user = authResult.user;
//     }

//     // final GoogleSignInAccount googleSignInAccount = await _googleSignIn.signIn();
//     // final GoogleSignInAuthentication googleSignInAuthentication =
//     //     await googleSignInAccount.authentication;

//     // final AuthCredential credential = GoogleAuthProvider.credential(
//     //   accessToken: googleSignInAuthentication.accessToken,
//     //   idToken: googleSignInAuthentication.idToken,
//     // );

//     // final UserCredential authResult =
//     //     await _auth.signInWithCredential(credential);
//     // final User user = authResult.user;
//     // // }
//   }

//   void signOutGoogle() async {
//     await _googleSignIn.disconnect();
//     await FirebaseAuth.instance.signOut();

//     print("User Sign Out");
//   }
// }
