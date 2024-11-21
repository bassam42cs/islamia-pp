import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islamii_app/config/settings_provider.dart';
import 'package:provider/provider.dart';

class SebhaView extends StatefulWidget {
  const SebhaView({super.key});

  @override
  State<SebhaView> createState() => SebhaViewState();
}

class SebhaViewState extends State<SebhaView> {
  double turns = 0.0;
  int counter = 0;
  int index = 0;
  List<String> do3a = ["سبحان الله", "الحمد لله", "الله اكبر", "استغفر الله"];

  void _changeRotation() {
    setState(() {
      turns += 1.0 / 9;
      counter++;
      if (counter == 34) {
        counter = 0;
        index++;
        if (index == do3a.length) {
          index = 0;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var vm = Provider.of<SettingProvider>(context);
    var mediaQuery = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
              onTap: _changeRotation,
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 80, right: 80),
                    child: Image.asset(
                      'assets/images/head of seb7a.png',
                      scale: 1.5,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: AnimatedRotation(
                      turns: turns,
                      duration: const Duration(seconds: 1),
                      child: Image.asset(
                        'assets/images/body of seb7a.png',
                        height: mediaQuery.height * 0.3,
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'عدد التسبيحات',
              style: TextStyle(
                  fontFamily: "El messiri",
                  fontWeight: FontWeight.w400,
                  fontSize: 20),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  backgroundColor: theme.primaryColor,
                  padding: const EdgeInsets.symmetric(
                    vertical: 20,
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15))),
              child: Text("$counter",
                  style: vm.current_theme == ThemeMode.light
                      ? theme.textTheme.bodyMedium
                      : theme.textTheme.bodyLarge),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: (){},
              style: ElevatedButton.styleFrom(
                  backgroundColor: vm.current_theme == ThemeMode.light
                      ? theme.primaryColor
                      : const Color(0xffFACC1D)),
              child: Text(do3a[index],
                  style: vm.current_theme == ThemeMode.light
                      ? theme.textTheme.bodyMedium
                      : theme.textTheme.bodySmall),
            ),
          ],
        ),
      ],
    );
  }
}