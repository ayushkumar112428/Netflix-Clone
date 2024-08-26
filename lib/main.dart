import 'package:flutter/material.dart';
import 'package:netflixclone/views/auth/sing_in_screen.dart';
import 'package:netflixclone/views/auth/sing_up_screen.dart';
import 'package:netflixclone/views/bottom_bar.dart';
import 'package:netflixclone/views/download/download_screen.dart';
import 'package:netflixclone/views/home/home_screen.dart';
import 'package:netflixclone/views/profile/profile_screen.dart';
import 'package:netflixclone/views/search/search_screen.dart';
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
        '/BottomBar': (context) => const BottomBar(),
        '/Home': (context) => const HomeScreen(),
        '/Search': (context) => const SearchScreen(),
        '/Download': (context) => const DownloadScreen(),
        '/Profile': (context) => const ProfileScreen(),
      },
    );
  }
}