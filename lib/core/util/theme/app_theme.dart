import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryColor = Colors.redAccent;

  static final ThemeData lightTheme = ThemeData.light().copyWith(
    //Primary Color
    primaryColor: Colors.amber,

    appBarTheme: const AppBarTheme(
      color: primaryColor,
      elevation: 0
    ),

    iconTheme: const IconThemeData(
      // size: 20,
      color: Colors.amber,
    ),

    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: primaryColor,
      ),
    ),

    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: primaryColor,
      elevation: 5,
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryColor,
        shape: const StadiumBorder(),
        elevation: 0,
      )
    ),

    inputDecorationTheme: const InputDecorationTheme(
      floatingLabelStyle: TextStyle(
        color: primaryColor, 
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: primaryColor,
        ),
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), topRight: Radius.circular(10)),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: primaryColor,
        ),
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15), topRight: Radius.circular(15)),
      ),
      // iconColor: primaryColor,
      
    ),
  );
}
