import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:islamii_app/config/settings_provider.dart';
import 'package:islamii_app/modules/hadeth/page/hadeth_view.dart';
import 'package:islamii_app/modules/quraan/page/quran_view.dart';
import 'package:islamii_app/modules/rdaio/page/radio_view.dart';
import 'package:islamii_app/modules/sepha/page/sepha_view.dart';
import 'package:islamii_app/modules/settings/page/setting_view.dart';
import 'package:islamii_app/translations/locale_keys.g.dart';
import 'package:provider/provider.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({super.key});

  static const route_name = 'Layout Screen';

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  int currentIndex = 0;
  List<Widget> Screens = [
    QuranView(),
    const HadethView(),
    const SebhaView(),
    const RadioView(),
    const SettingView(),
  ];

  @override
  Widget build(BuildContext context) {
    var vm = Provider.of<SettingProvider>(context);
    var theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(vm.getBackground()), fit: BoxFit.fill)),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            LocaleKeys.islami.tr(),
            style: vm.current_theme == ThemeMode.dark
                ? theme.textTheme.titleLarge
                : theme.textTheme.titleLarge,
          ),
        ),
        body: Screens[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (value) {
            setState(() {
              currentIndex = value;
            });
          },
          items: [
            BottomNavigationBarItem(
                icon: const ImageIcon(AssetImage('assets/images/quraan.png')),
                label: LocaleKeys.quran.tr()),
            BottomNavigationBarItem(
                icon: const ImageIcon(AssetImage('assets/images/hadeth.png')),
                label: LocaleKeys.hadeth.tr()),
            BottomNavigationBarItem(
                icon: const ImageIcon(AssetImage('assets/images/sebha.png')),
                label: LocaleKeys.tasbeh.tr()),
            BottomNavigationBarItem(
                icon: const ImageIcon(AssetImage('assets/images/radio.png')),
                label: LocaleKeys.radio.tr()),
            BottomNavigationBarItem(
                icon: const Icon(Icons.settings),
                label: LocaleKeys.settings.tr()),
          ],
        ),
      ),
    );
  }
}
