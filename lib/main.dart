import 'package:flutter/material.dart';
import './login.dart';
import 'package:firebase_core/firebase_core.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyCQ5NPsYwnmnNFoEgfV-BfR0xx0PEcNyBA", // Your apiKey
      appId: "1:329252734503:android:e0909157e4bfb723f57002", // Your appId
      messagingSenderId: "XXX", // Your messagingSenderId
      projectId: "smobe-218e8", // Your projectId
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
        textTheme: TextTheme(headline3: TextStyle(fontFamily: 'NexaBold')),
      ),
      home: LoginScreen(),
    );
  }
}
