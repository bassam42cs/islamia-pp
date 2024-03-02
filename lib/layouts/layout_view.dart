import 'package:flutter/material.dart';
import 'package:islami_app/moduls/hadeth/page/hadeth_view.dart';
import 'package:islami_app/moduls/quran/page/QuranView.dart';
import 'package:islami_app/moduls/radio/page/ridoa_view.dart';
import 'package:islami_app/moduls/sebha/page/tasbeh_veiw.dart';

class LayoutView extends StatefulWidget {
  LayoutView({super.key});

  static const String routeName = "layoutView";

  @override
  State<LayoutView> createState() => _LayoutViewState();
}

class _LayoutViewState extends State<LayoutView> {
  int currentIndex = 0;

  List<Widget> screens = [
    QuranView(),
    HadethView(),
    TasbehView(),
    RadioView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/default_bg.png"),
              fit: BoxFit.cover)),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("إسلامي"),
        ),
        body: screens[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage("assets/images/icon_quran@3x.png")),
                label: "Quran"),
            BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage("assets/images/icon_hadeth@3x.png"),
                ),
                label: "Hadeth"),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage("assets/images/icon_sebha@3x.png")),
                label: "Sebha"),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage("assets/images/icon_radio@3x.png")),
                label: "Radio"),
          ],
        ),
      ),
    );
  }
}
