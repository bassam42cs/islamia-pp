import 'package:flutter/material.dart';

class AplicationThemManger {
  static const Color primaryColor = Color(0xffB7935F);
  static const Color primaryDarkColor = Color(0xff141A2E);
  static const Color onPrimaryDarkColor = Color(0xffFACC1D);

  static ThemeData lightTheme = ThemeData(
      primaryColor: primaryColor,
      useMaterial3: true,
      buttonTheme: const ButtonThemeData(buttonColor: primaryColor),
      scaffoldBackgroundColor: Colors.transparent,
      dividerTheme: const DividerThemeData(color: primaryColor),
      appBarTheme: const AppBarTheme(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
        titleTextStyle: TextStyle(
            fontFamily: "El messiri",
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.white),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: primaryColor,
          type: BottomNavigationBarType.fixed,
          selectedIconTheme: IconThemeData(color: Colors.black),
          selectedItemColor: Colors.black,
          selectedLabelStyle: TextStyle(
              fontFamily: "El Mesiri",
              fontSize: 17,
              fontWeight: FontWeight.normal),
          unselectedItemColor: Colors.white,
          unselectedLabelStyle: TextStyle(
              fontFamily: "El Mesiri",
              fontSize: 16,
              fontWeight: FontWeight.normal),
          unselectedIconTheme: IconThemeData(color: Colors.white)),
      textTheme: const TextTheme(
          titleLarge: TextStyle(
              fontFamily: "El messiri",
              fontWeight: FontWeight.bold,
              fontSize: 30,
              color: Colors.black),
          bodyLarge: TextStyle(
            fontFamily: "El messiri",
            fontWeight: FontWeight.w500,
            fontSize: 25,
          ),
          bodyMedium: TextStyle(
            fontFamily: "El messiri",
            fontWeight: FontWeight.normal,
            fontSize: 25,
          ),
          bodySmall: TextStyle(
              fontFamily: "El messiri",
              fontWeight: FontWeight.normal,
              fontSize: 20,
              color: Colors.black)));
  static ThemeData darkTheme = ThemeData(
      primaryColor: primaryDarkColor,
      buttonTheme: const ButtonThemeData(buttonColor: onPrimaryDarkColor),
      useMaterial3: true,
      dividerTheme: const DividerThemeData(color: onPrimaryDarkColor),
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: const AppBarTheme(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
        titleTextStyle: TextStyle(
            fontFamily: "El messiri",
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.white),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: primaryDarkColor,
          type: BottomNavigationBarType.fixed,
          selectedIconTheme: IconThemeData(color: onPrimaryDarkColor),
          selectedItemColor: onPrimaryDarkColor,
          selectedLabelStyle: TextStyle(
              fontFamily: "El Mesiri",
              fontSize: 17,
              fontWeight: FontWeight.normal),
          unselectedItemColor: Colors.white,
          unselectedLabelStyle: TextStyle(
              fontFamily: "El Mesiri",
              fontSize: 16,
              fontWeight: FontWeight.normal),
          unselectedIconTheme: IconThemeData(color: Colors.white)),
      textTheme: const TextTheme(
          titleLarge: TextStyle(
              fontFamily: "El messiri",
              fontWeight: FontWeight.bold,
              fontSize: 30,
              color: Colors.white),
          bodyLarge: TextStyle(
              fontFamily: "El messiri",
              fontWeight: FontWeight.w500,
              fontSize: 25,
              color: Colors.white),
          bodyMedium: TextStyle(
              fontFamily: "El messiri",
              fontWeight: FontWeight.normal,
              fontSize: 25,
              color: onPrimaryDarkColor),
          bodySmall: TextStyle(
              fontFamily: "El messiri",
              fontWeight: FontWeight.normal,
              fontSize: 20,
              color: Colors.black)));
}