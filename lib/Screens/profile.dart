import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebaselogin/Utils/furebase_ggogle.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Pofile extends StatefulWidget {
  const Pofile();

  // final User _user;

  @override
  _PofileState createState() => _PofileState();
}

class _PofileState extends State<Pofile> {
  @override
  void initState() {
    super.initState();

    // initApp();
  }

  @override
  Widget build(BuildContext context) {
    final _user = FirebaseAuth.instance.currentUser;
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text("Profile"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  height: MediaQuery.of(context).size.width * .26,
                  width: MediaQuery.of(context).size.width * .26,
                  padding: EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(_user.photoURL.toString()),
                    ),
                  )),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  _user.displayName,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(_user.email),
              ),
              ElevatedButton(
                  onPressed: () {
                    final _auth =
                        Provider.of<Authentication>(context, listen: false);

                    _auth.signOutGoogle();
                  },
                  child: Text("signout"))
            ],
          ),
        ));
  }
}
