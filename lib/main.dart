import 'package:flutter/material.dart';
import 'package:islami_app/config/application_theme_manger.dart';
import 'package:islami_app/layouts/layout_view.dart';
import 'package:islami_app/moduls/hadeth/page/hadeth_detials_view.dart';
import 'package:islami_app/moduls/quran/page/quran_view_deteles.dart';
import 'package:islami_app/moduls/splash/splash_screen.dart';


void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ApplicationTheme.lightMode,
      themeMode: ThemeMode.light,
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName: (context) => const SplashScreen(),
        LayoutView.routeName: (context) => LayoutView(),
        QuranViewDeteles.routeName: (context) => QuranViewDeteles(),
        HadethDetailsView.routeName: (context) => const HadethDetailsView(),
      },
    );
  }
}
