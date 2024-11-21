import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamii_app/modules/hadeth/page/hadeth_details.dart';

class HadethView extends StatefulWidget {
  const HadethView({super.key});

  @override
  State<HadethView> createState() => _HadethViewState();
}

class _HadethViewState extends State<HadethView> {
  List<HadethData> allHadethData = [];

  @override
  Widget build(BuildContext context) {
    if (allHadethData.isEmpty) loadData();
    var mediaQuery = MediaQuery.of(context).size;
    var theme = Theme.of(context);
    return Column(
      children: [
        Image.asset(
          'assets/images/hadeth_bg.png',
          height: mediaQuery.height * 0.2,
        ),
        const Divider(
          thickness: 1.2,
        ),
        Text('الأحاديث', style: theme.textTheme.bodyLarge),
        const Divider(
          thickness: 1.2,
        ),
        Expanded(
          child: ListView.builder(
              itemBuilder: (context, index) => InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, HadethDetailsView.route_name,
                          arguments: allHadethData[index]);
                    },
                    child: Text(
                      allHadethData[index].hadeth_title,
                      style: theme.textTheme.bodyMedium,
                      textAlign: TextAlign.center,
                    ),
                  ),
              itemCount: allHadethData.length),
        )
      ],
    );
  }

  Future<void> loadData() async {
    String hadethContent =
        await rootBundle.loadString('assets/files/ahadeth.txt');
    List<String> allHadeth = hadethContent.split("#");
    for (int i = 0; i < allHadeth.length; i++) {
      String singleHadeth = allHadeth[i].trim();
      int titleIndex = singleHadeth.indexOf("\n");
      String title = singleHadeth.substring(0, titleIndex);
      String content = singleHadeth.substring(titleIndex + 1);
      HadethData hadethData = HadethData(title, content);
      allHadethData.add(hadethData);
      print(title);
      setState(() {});
    }
  }
}

class HadethData {
  final String hadeth_title;
  final String hadeth_content;

  HadethData(this.hadeth_title, this.hadeth_content);
}
