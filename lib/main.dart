import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
    return MaterialApp.router(
      title: 'Netflix Clone',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black,
      ),
      routerConfig: _router,
      // initialRoute: '/BottomBar',
      // routes: {
      //   '/SP': (context) =>  SplashScreen(),
      //   '/SingIn': (context) =>  SingInScreen(),
      //   '/SingUp': (context) =>  SingUpScreen(),
      //   '/BottomBar': (context) =>  BottomBar(),
      //   '/Home': (context) =>  HomeScreen(),
      //   '/Search': (context) =>  SearchScreen(),
      //   '/Download': (context) =>  DownloadScreen(),
      //   '/Profile': (context) =>  ProfileScreen(),
      // },
    );
  }
}

final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const SplashScreen();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'singIn',
          builder: (BuildContext context, GoRouterState state) {
            return const SingInScreen();
          },
        ),
        GoRoute(
          path: 'singUp',
          builder: (BuildContext context, GoRouterState state) {
            return const SingUpScreen();
          },
        ),
        GoRoute(
          path: 'bottomBar',
          builder: (BuildContext context, GoRouterState state) {
            return const BottomBar();
          },
        ),
        GoRoute(
          path: 'home',
          builder: (BuildContext context, GoRouterState state) {
            return const HomeScreen();
          },
        ),
        GoRoute(
          path: 'search',
          builder: (BuildContext context, GoRouterState state) {
            return const SearchScreen();
          },
        ),
        GoRoute(
          path: 'download',
          builder: (BuildContext context, GoRouterState state) {
            return const DownloadScreen();
          },
        ),
        GoRoute(
          path: 'profile',
          builder: (BuildContext context, GoRouterState state) {
            return const ProfileScreen();
          },
        ),
      ],
    ),
  ],
);