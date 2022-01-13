import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:puchong/Homepage.dart';
import 'package:puchong/SplashScreen.dart';
import 'package:puchong/Test.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
 // const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Gardener',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
     // home: Homepage(),
      home: SplashScreen(),
    );
  }
}

