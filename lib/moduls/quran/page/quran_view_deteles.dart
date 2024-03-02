import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/moduls/quran/page/QuranView.dart';

class QuranViewDeteles extends StatefulWidget {
  QuranViewDeteles({super.key});

  static String routeName = "QuranViewDeteles";

  @override
  State<QuranViewDeteles> createState() => _QuranViewDetelesState();
}

class _QuranViewDetelesState extends State<QuranViewDeteles> {
  List<String> revirsList = [];

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var arge = ModalRoute.of(context)?.settings.arguments as SuraDetail;
    if (revirsList.isEmpty) loadingSura(arge.suraNumber);

    return Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/default_bg.png"),
              fit: BoxFit.fill),
        ),
        child: Scaffold(
          appBar: AppBar(
            title: Text("إسلامي"),
          ),
          body: Container(
              margin: const EdgeInsets.only(
                top: 15,
                left: 20,
                right: 20,
                bottom: 80,
              ),
              padding: const EdgeInsets.only(
                top: 15,
                left: 20,
                right: 20,
                bottom: 15,
              ),
              decoration: BoxDecoration(
                color: const Color(0xfff8f8f8).withOpacity(.8),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        " سورة ${arge.suraName}",
                        style: const TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Icon(
                        Icons.play_circle_fill_outlined,
                        size: 30,
                      ),
                    ],
                  ),
                  Divider(
                    color: theme.primaryColor,
                  ),
                  if (revirsList.isEmpty)
                    Center(
                      child: CircularProgressIndicator(
                        color: theme.primaryColor,
                      ),
                    ),
                  if (revirsList.isNotEmpty)
                    Expanded(
                        child: ListView.builder(
                      itemBuilder: (context, index) => Text(
                        "{${(index + 1).toString()}} ${revirsList[index]}",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.normal,
                            color: Colors.black),
                      ),
                      itemCount: revirsList.length,
                    ))
                ],
              )),
        ));
  }

  Future<void> loadingSura(String suraNumber) async {
    String suraContent =
        await rootBundle.loadString("assets/files/$suraNumber.txt");
    revirsList = suraContent.split("\n");
    setState(() {});
  }
}
