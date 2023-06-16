import 'package:flutter/material.dart';
import 'package:rice_disease/screen/home.dart';
import 'package:rice_disease/screen/info.dart';
import 'package:rice_disease/screen/login.dart';
import 'package:rice_disease/screen/profile.dart';
import 'package:rice_disease/screen/signup.dart';
import 'package:rice_disease/screen/splash.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'RiceScan',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
          useMaterial3: true,
        ),
        routes: {
          '/': (_) => const Splash(),
          '/login': (_) => const Login(),
          '/signup': (_) => const Signup(),
          '/home': (_) => const Home(),
          '/info': (_) => const Info(),
          '/profile': (_) => const Profile(),
        },
        initialRoute: '/');
  }
}
