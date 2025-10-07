import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'routes.dart';
import 'firebase_options.dart'; // este archivo lo genera flutterfire configure

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
      debugShowCheckedModeBanner: false,
      title: 'Lenguaje de señas',
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      initialRoute: AppRoutes.splash,
      routes: AppRoutes.routes,
    );
  }
}
