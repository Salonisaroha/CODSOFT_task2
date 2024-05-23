import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:quizz_app/admin/login.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  options: FirebaseOptions(apiKey: "AIzaSyCVhdpotu5q1C8fEKTR6PZReEAw3y-JJBE", appId: "1:928220692773:android:4e6bb5f60b3b8f3d13dacc", messagingSenderId: "", projectId: "quizzapp-c9bd2")
 );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Admin(),
    );
  }
}
