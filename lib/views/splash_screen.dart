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
    _navigateToHome();
  }

  Future<void> _navigateToHome() async {
    await Future.delayed(const Duration(seconds: 2));
    // Check if the widget is still in the widget tree
    if (mounted) {
      Navigator.pushReplacementNamed(context, "/SingIn");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        "assets/netflix/netflixisplashicon.gif",
        fit: BoxFit.cover,
      ),
    );
  }
}
