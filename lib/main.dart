import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:smobe_ea/loginscreen.dart';
import './loginscreen.dart';
import 'package:firebase_core/firebase_core.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyC2d5InnWCdzaxuaazIMabaBLTyKqeolMM", // Your apiKey
      appId: "1:757017620931:android:fb7906b0bf1b1cfd5ecd76", // Your appId
      messagingSenderId: "XXX", // Your messagingSenderId
      projectId: "smobe-6d795", // Your projectId
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Smobe',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
        textTheme: const TextTheme(headline3: TextStyle(fontFamily: 'NexaBold')),
      ),
      home:const MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) => Scaffold(
        body: StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return const Text('home');
              } else {
                return const LoginScreen();
              }
            }),
      );
}
