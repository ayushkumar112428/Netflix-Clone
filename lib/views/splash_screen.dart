import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    // Simulate a delay for the splash screen
    Future.delayed(const Duration(seconds: 2), () {
      // Navigate to the next screen after the delay
      Navigator.pushNamed(context, 'SingIn');
      // Navigator.pushReplacement(
      //   context,
      //   MaterialPageRoute(builder: (context) => const SingInScreen()),
      // );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          "assets/netflix/netflixisplashicon.gif",
        ),
      ),
    );
  }
}
