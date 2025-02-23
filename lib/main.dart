import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';

import 'package:lugia/core/theme.dart';
import 'package:lugia/creations/screens/create.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      home: const CreateCreationScreen(),
    );
  }
}
