import 'package:flutter/material.dart';
import 'package:islamii_app/config/settings_provider.dart';
import 'package:provider/provider.dart';

class SuraTitle extends StatelessWidget {
  final String suraName;
  final String suraNumber;

  const SuraTitle(
      {super.key, required this.suraName, required this.suraNumber});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var vm = Provider.of<SettingProvider>(context);
    return Row(
      children: [
        Expanded(
          child: Text(
            suraNumber,
            style: vm.current_theme == ThemeMode.light
                ? theme.textTheme.bodyLarge
                : theme.textTheme.bodyLarge,
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(
          width: 2,
          height: 36,
          child: VerticalDivider(),
        ),
        Expanded(
          child: Text(
            suraName,
            style: vm.current_theme == ThemeMode.light
                ? theme.textTheme.bodyLarge
                : theme.textTheme.bodyLarge,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
