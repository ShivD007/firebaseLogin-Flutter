import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebaselogin/Screens/home_screen.dart';
import 'package:firebaselogin/Screens/profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  // ignore: missing_return
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/home":
        return MaterialPageRoute(builder: (context) => HomeScreen());

      case "/profile":
        // final _user = settings.arguments;
        return MaterialPageRoute(builder: (context) => Pofile());
    }
  }
}
