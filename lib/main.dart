import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hogozat/ui/bill/page/bill_screen.dart';
import 'package:hogozat/ui/login/page/login_screen.dart';
import 'package:hogozat/ui/main/page/main.dart';

import 'core/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await PreferenceUtils.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demoo',
      theme: ThemeData(
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.transparent),
        // useMaterial3: true,
        primarySwatch: Colors.blue
      ),
      home: PreferenceUtils.getBool(PrefKeys.loggedIn)?const MainScreen():const LoginScreen(),
    );
  }
}

