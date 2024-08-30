import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:netflixclone/views/auth/sing_in_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  Widget build(BuildContext context) {
    return FlutterSplashScreen(
      useImmersiveMode: true,
      duration: const Duration(seconds: 2),
      nextScreen: const SingInScreen(),
      splashScreenBody: Center(
        child: Image.asset(
          "assets/netflix/netflixisplashicon.gif",
        ),
      ),
    );
  }
}
