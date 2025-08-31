// ...existing code...
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/Providers/NoteProvider.dart';
import 'package:notes_app/splash.dart';
import 'package:provider/provider.dart';
import 'package:notes_app/Providers/AuthProvider.dart';

 

// ...existing code...

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // make sure firebase is initialized

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<MyAuthProvider>(
          create: (_) => MyAuthProvider(),
        ),
        ChangeNotifierProvider<NoteProvider>(
          create: (_)=>NoteProvider(),
          )
        // ...existing code...
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashSCreen(), // <-- Correct spelling
      ),
    );
  }
}
// ...existing code...