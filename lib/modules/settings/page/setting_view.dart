import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:islamii_app/config/settings_provider.dart';
import 'package:islamii_app/translations/locale_keys.g.dart';
import 'package:provider/provider.dart';

class SettingView extends StatefulWidget {
  const SettingView({super.key});

  @override
  State<SettingView> createState() => _SettingViewState();
}

class _SettingViewState extends State<SettingView> {
  List<String> languageList = ["English", "عربي"];
  List<String> themeList = ["Light", "Dark"];

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var vm = Provider.of<SettingProvider>(context);

    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(LocaleKeys.language.tr(), style: theme.textTheme.bodyLarge),
          const SizedBox(
            height: 10,
          ),
          CustomDropdown<String>(
            initialItem: vm.current_language == "en" ? "English" : "عربي",
            decoration: CustomDropdownDecoration(
              expandedFillColor:
                  vm.isDark() ? const Color(0xff141A2E) : Colors.white,
              closedFillColor:
                  vm.isDark() ? const Color(0xff141A2E) : Colors.white,
              closedSuffixIcon: Icon(
                Icons.keyboard_arrow_down_rounded,
                color: vm.isDark() ? const Color(0xffFACC1D) : Colors.black,
              ),
              expandedSuffixIcon: Icon(
                Icons.keyboard_arrow_up_rounded,
                color: vm.isDark() ? const Color(0xffFACC1D) : Colors.black,
              ),
            ),
            items: languageList,
            onChanged: (value) async {
              if (value == "English") {
                await vm.changeLanguage("en");
                context.setLocale(const Locale("en"));
              } else if (value == "عربي") {
                await vm.changeLanguage("ar");
                context.setLocale(const Locale("ar"));
              }
            },
          ),
          const SizedBox(
            height: 40,
          ),
          Text(LocaleKeys.theme.tr(), style: theme.textTheme.bodyLarge),
          const SizedBox(
            height: 10,
          ),
          CustomDropdown<String>(
            initialItem: vm.isDark() ? "Dark" : "Light",
            decoration: CustomDropdownDecoration(
              expandedFillColor:
                  vm.isDark() ? const Color(0xff141A2E) : Colors.white,
              closedFillColor:
                  vm.isDark() ? const Color(0xff141A2E) : Colors.white,
              closedSuffixIcon: Icon(
                Icons.keyboard_arrow_down_rounded,
                color: vm.isDark() ? const Color(0xffFACC1D) : Colors.black,
              ),
              expandedSuffixIcon: Icon(
                Icons.keyboard_arrow_up_rounded,
                color: vm.isDark() ? const Color(0xffFACC1D) : Colors.black,
              ),
            ),
            items: themeList,
            onChanged: (value) async {
              if (value == "Light") {
                await vm.changeTheme(ThemeMode.light);
              } else if (value == "Dark") {
                await vm.changeTheme(ThemeMode.dark);
              }
            },
          )
        ],
      ),
    );
  }
}