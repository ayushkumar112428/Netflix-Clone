import 'package:flutter/material.dart';

class AppTheme with ChangeNotifier {
  // Define a boolean to track whether the theme is dark
  bool _isDarkTheme = true;

  // Getter for the current theme mode
  bool get isDarkTheme => _isDarkTheme;

  // Method to toggle between light and dark themes
  void toggleTheme() {
    _isDarkTheme = !_isDarkTheme;
    notifyListeners(); // Notify listeners to rebuild UI with new theme
  }

  // Getter for the current ThemeData based on the theme mode
  ThemeData get currentTheme {
    return _isDarkTheme ? darkTheme : lightTheme;
  }

  // Light Theme Definition
  ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.red,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.red,
      titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
    ),

    textTheme: const TextTheme(

    ),
    iconTheme: const IconThemeData(color: Colors.black),
    buttonTheme: const ButtonThemeData(buttonColor: Colors.red),
  );

  // Dark Theme Definition
  ThemeData darkTheme = ThemeData(

    brightness: Brightness.dark,
    primaryColor: Colors.red,
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.black,
      titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
    ),

    textTheme: const TextTheme(

    ),

    iconTheme: const IconThemeData(color: Colors.white),
    buttonTheme: const ButtonThemeData(buttonColor: Colors.red),
  );
}
