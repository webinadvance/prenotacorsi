import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:prenotacorsi/widgets/LoginPage.dart';
import 'firebase_options.dart';

import 'widgets/MyHomePage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Check if Firebase is initialized correctly
  try {
    Firebase.app();
    print('Firebase initialized successfully.');
  } catch (e) {
    print('Error: Firebase not initialized.');
  }

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
      routes: {
        '/login': (context) => LoginPage(),
      },
    );
  }
}
