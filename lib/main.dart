import 'package:flutter/material.dart';
import 'package:netflixclone/views/auth/sing_in_screen.dart';
import 'package:netflixclone/views/auth/sing_up_screen.dart';
import 'package:netflixclone/views/splash_screen.dart';

void main() {
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
      title: 'Netflix Clone',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/SingIn': (context) => const SingInScreen(),
        '/SingUp': (context) => const SingUpScreen(),
      },
    );
  }
}