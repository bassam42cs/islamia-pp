import 'package:flutter/material.dart';

class ApplicationTheme {
  static const Color primaryColor = Color(0xffB7935F);
  static ThemeData lightMode = ThemeData(
      primaryColor: primaryColor,
      useMaterial3: true,
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: const AppBarTheme(
          elevation: 0,
          color: Colors.transparent,
          iconTheme: IconThemeData(color: Colors.black),
          centerTitle: true,
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          )),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: primaryColor,
          type: BottomNavigationBarType.fixed,
          selectedIconTheme: IconThemeData(
            color: Color(0xff070707),
          ),
          selectedItemColor: Color(0xff070707),
          selectedLabelStyle: TextStyle(
              color: Color(0xff070707),
              fontSize: 17,
              fontWeight: FontWeight.normal),
          unselectedIconTheme: IconThemeData(
            color: Colors.white,
          ),
          unselectedItemColor: Colors.white,
          unselectedLabelStyle: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 14,
              color: Colors.white))
  );
  static ThemeData darkMode = ThemeData(

  );

}
