import 'package:E_Class/splashscree.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: key,
      theme: ThemeData(brightness: Brightness.light),
      title: 'Flutter Demo',
      home: SplashScreen(),
    );
  }
}
