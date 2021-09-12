import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebaselogin/Screens/profile.dart';
import 'package:firebaselogin/Utils/furebase_ggogle.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();

    // print(_auth.isSigningIn);
    // initApp();
  }

  // FirebaseAuth _auth;
  // void initApp() async {
  //   FirebaseApp defaultApp = await Firebase.initializeApp();
  //   FirebaseAuth.instanceFor(app: defaultApp);
  //   // immediately check whether the user is signed in
  //   //  checkIfUserIsSignedIn();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            final _auth = Provider.of<Authentication>(context, listen: false);
            if (_auth.isSigningIn) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasData) {
              return Pofile();
            } else {
              return Center(
                  child:
                      //  Image.asset('Assets/google-logo.png')
                      Column(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Firebase Login"),
                  Spacer(),
                  ElevatedButton.icon(
                      onPressed: () async {
                        await _auth.signInWithGoogle();
                        print("object..........................");

                        // Navigator.pushNamed(context, "/profile",
                        //     arguments: FirebaseAuth.instance.currentUser);
                      },
                      icon: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          "Assets/google-logo.png",
                          height: 50,
                        ),
                      ),
                      label: Text("Sign with google")),
                  Spacer(),
                ],
              ));
            }
          }),
    ));
  }
}
