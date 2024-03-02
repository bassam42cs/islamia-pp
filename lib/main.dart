import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:islami_app/config/application_theme_manger.dart';
import 'package:islami_app/config/setting_provider.dart';
import 'package:islami_app/layouts/layout_view.dart';
import 'package:islami_app/moduls/hadeth/page/hadeth_detials_view.dart';
import 'package:islami_app/moduls/quran/page/quran_view_deteles.dart';
import 'package:islami_app/moduls/splash/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => SettingProvider(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'), // English
        Locale('ar'), //arabic
      ],
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
