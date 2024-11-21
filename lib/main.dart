import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:islamii_app/config/settings_provider.dart';
import 'package:islamii_app/layout/layout_view.dart';
import 'package:islamii_app/modules/hadeth/page/hadeth_details.dart';
import 'package:islamii_app/modules/splash/page/splash_view.dart';
import 'package:islamii_app/translations/codegen_loader.g.dart';
import 'package:provider/provider.dart';

import 'config/aplication_them_manager.dart';
import 'modules/quraan/page/quran_details.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
   var provider = SettingProvider();
   await provider.loadSettings();
  runApp(ChangeNotifierProvider(
    create: (context) => provider,
    child: EasyLocalization(
      path: "assets/translations/",
      supportedLocales: const [
        Locale("en"),
        Locale("ar"),
      ],
      fallbackLocale: const Locale("en"),
      assetLoader: const CodegenLoader(),
      child: const Myapplication(),
    ),
  ));
}

class Myapplication extends StatelessWidget {
  const Myapplication({super.key});

  @override
  Widget build(BuildContext context) {
    var vm = Provider.of<SettingProvider>(
        context); //to listen same object --create one object

    return MaterialApp(
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,
      locale: Locale(vm.current_language),
      theme: AplicationThemManger.lightTheme,
      darkTheme: AplicationThemManger.darkTheme,
      themeMode: vm.current_theme,
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.route_name,
      routes: {
        SplashScreen.route_name: (context) => const SplashScreen(),
        LayoutScreen.route_name: (context) => const LayoutScreen(),
        QuranDetailsView.route_name: (context) => const QuranDetailsView(),
        HadethDetailsView.route_name: (context) => const HadethDetailsView(),
      },
    );
  }
}