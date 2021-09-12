import 'package:firebase_core/firebase_core.dart';
import 'package:firebaselogin/Screens/home_screen.dart';
import 'package:firebaselogin/Utils/furebase_ggogle.dart';
import 'package:firebaselogin/Utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Authentication(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: "/home",
        onGenerateRoute: RouteGenerator.generateRoute,
      ),
    );
  }
}
