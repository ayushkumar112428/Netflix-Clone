import 'package:flutter/material.dart';
import 'package:netflixclone/views/auth/sing_in_screen.dart';
import 'package:netflixclone/views/auth/sing_up_screen.dart';
import 'package:netflixclone/views/bottom_bar.dart';
import 'package:netflixclone/views/download/download_screen.dart';
import 'package:netflixclone/views/home/home_screen.dart';
import 'package:netflixclone/views/my_list/my_list.dart';
import 'package:netflixclone/views/profile/my_netflix.dart';
import 'package:netflixclone/views/profile/notification_screen.dart';
import 'package:netflixclone/views/profile/profile_screen.dart';
import 'package:netflixclone/views/search/search_screen.dart';
import 'package:netflixclone/views/show_page/movie_screen.dart';
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
      // home: const SplashScreen(),
      initialRoute: "/BottomBar",
      routes: {
        '/SP': (context) => const SplashScreen(),
        '/SingIn': (context) => const SingInScreen(),
        '/SingUp': (context) => const SingUpScreen(),
        '/BottomBar': (context) => const BottomBar(),
        '/Home': (context) => const HomeScreen(),
        '/Search': (context) => const SearchScreen(),
        '/Download': (context) => const DownloadScreen(),
        '/Profile': (context) => const ProfileScreen(),
        '/Movie': (context) => const MovieScreen(),
        '/MyNetflix': (context) => const MyNetflix(),
        '/MyList': (context) => const MyList(),
        '/Notification': (context) => const NotificationScreen(),
      },
    );
  }
}
