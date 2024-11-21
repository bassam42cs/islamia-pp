import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamii_app/config/settings_provider.dart';
import 'package:islamii_app/modules/quraan/page/quran_view.dart';
import 'package:provider/provider.dart';

class QuranDetailsView extends StatefulWidget {
  static const String route_name = "quran_details";

  const QuranDetailsView({super.key});

  @override
  State<QuranDetailsView> createState() => _QuranDetailsViewState();
}

class _QuranDetailsViewState extends State<QuranDetailsView> {
  List<String> versesList = [];

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as QuranDetail;
    var mediaQuery = MediaQuery.of(context).size;
    var theme = Theme.of(context);
    var vm = Provider.of<SettingProvider>(context);

    // sync Vs async
    if (versesList.isEmpty) loadData(args.sura_number);

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(vm.getBackground()),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text("إسلامي", style: theme.textTheme.titleLarge),
        ),
        body: Container(
          width: mediaQuery.width,
          height: mediaQuery.height,
          margin: const EdgeInsets.only(
            right: 20,
            left: 20,
            top: 15,
            bottom: 80,
          ),
          padding: const EdgeInsets.only(
            right: 20,
            left: 20,
            top: 15,
            bottom: 15,
          ),
          decoration: BoxDecoration(
              color: vm.current_theme == ThemeMode.dark
                  ? Color(0XFF141A2E).withOpacity(0.8)
                  : Color(0xffF8F8F8),
              borderRadius: BorderRadius.circular(25)),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "سورة ${args.sura_name}",
                      style: vm.current_theme == ThemeMode.dark
                          ? theme.textTheme.bodyMedium
                          : theme.textTheme.bodyMedium),
                  const SizedBox(width: 10),
                  Icon(Icons.play_circle_filled_rounded,
                      size: 28,
                      color: vm.current_theme == ThemeMode.light
                          ? Colors.black
                          : Color(0xffFACC1D)),
                ],
              ),
              const Divider(
                thickness: 2,
              ),
              if (versesList.isEmpty)
                Center(
                  child: CircularProgressIndicator(
                    color: theme.primaryColor,
                  ),
                ),
              if (versesList.isNotEmpty)
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, index) => Text(
                      "{${index + 1}} ${versesList[index]}",
                      textAlign: TextAlign.center,
                        style: vm.current_theme == ThemeMode.dark
                            ? theme.textTheme.bodyMedium
                            : theme.textTheme.bodyMedium),
                    itemCount: versesList.length,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> loadData(String suraNumber) async {
    String suraContent =
        await rootBundle.loadString("assets/files/$suraNumber.txt");
    versesList = suraContent.split("\n");
    setState(() {});
  }
}
