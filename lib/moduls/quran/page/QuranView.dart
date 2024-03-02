import 'package:flutter/material.dart';
import 'package:islami_app/moduls/quran/Widgets/soura_widget.dart';
import 'package:islami_app/moduls/quran/page/quran_view_deteles.dart';

class QuranView extends StatelessWidget {
  QuranView({super.key});

  final List<String> suraName = [
    "الفاتحه",
    "البقرة",
    "آل عمران",
    "النساء",
    "المائدة",
    "الأنعام",
    "الأعراف",
    "الأنفال",
    "التوبة",
    "يونس",
    "هود",
    "يوسف",
    "الرعد",
    "إبراهيم",
    "الحجر",
    "النحل",
    "الإسراء",
    "الكهف",
    "مريم",
    "طه",
    "الأنبياء",
    "الحج",
    "المؤمنون",
    "النّور",
    "الفرقان",
    "الشعراء",
    "النّمل",
    "القصص",
    "العنكبوت",
    "الرّوم",
    "لقمان",
    "السجدة",
    "الأحزاب",
    "سبأ",
    "فاطر",
    "يس",
    "الصافات",
    "ص",
    "الزمر",
    "غافر",
    "فصّلت",
    "الشورى",
    "الزخرف",
    "الدّخان",
    "الجاثية",
    "الأحقاف",
    "محمد",
    "الفتح",
    "الحجرات",
    "ق",
    "الذاريات",
    "الطور",
    "النجم",
    "القمر",
    "الرحمن",
    "الواقعة",
    "الحديد",
    "المجادلة",
    "الحشر",
    "الممتحنة",
    "الصف",
    "الجمعة",
    "المنافقون",
    "التغابن",
    "الطلاق",
    "التحريم",
    "الملك",
    "القلم",
    "الحاقة",
    "المعارج",
    "نوح",
    "الجن",
    "المزّمّل",
    "المدّثر",
    "القيامة",
    "الإنسان",
    "المرسلات",
    "النبأ",
    "النازعات",
    "عبس",
    "التكوير",
    "الإنفطار",
    "المطفّفين",
    "الإنشقاق",
    "البروج",
    "الطارق",
    "الأعلى",
    "الغاشية",
    "الفجر",
    "البلد",
    "الشمس",
    "الليل",
    "الضحى",
    "الشرح",
    "التين",
    "العلق",
    "القدر",
    "البينة",
    "الزلزلة",
    "العاديات",
    "القارعة",
    "التكاثر",
    "العصر",
    "الهمزة",
    "الفيل",
    "قريش",
    "الماعون",
    "الكوثر",
    "الكافرون",
    "النصر",
    "المسد",
    "الإخلاص",
    "الفلق",
    "الناس"
  ];

  @override
  Widget build(BuildContext context) {
    var midiaQuery = MediaQuery.of(context).size;
    var theme = Theme.of(context);
    return Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/default_bg.png"),
                fit: BoxFit.fill)),
        child: Scaffold(
          body: Column(children: [
            Image.asset(
              "assets/images/qur2an_screen_logo.png",
              height: midiaQuery.height * .2,
              fit: BoxFit.fill,
            ),
            Divider(
              thickness: 1.5,
              color: theme.primaryColor,
            ),
            Row(
              children: [
                const Expanded(
                  child: Text(
                    "رقم السورة ",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                ),
                Container(
                  color: theme.primaryColor,
                  height: 38,
                  width: 1.5,
                ),
                const Expanded(
                  child: Text(
                    "اسم السورة ",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                ),
              ],
            ),
            Divider(
              thickness: 1.6,
              color: theme.primaryColor,
            ),
            Expanded(
                child: ListView.builder(
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, QuranViewDeteles.routeName,
                      arguments:
                          SuraDetail(suraName[index], (index + 1).toString()));
                },
                child: Sura(
                  suraName: suraName[index],
                  suraNumber: (index + 1).toString(),
                ),
              ),
              itemCount: suraName.length,
            )),
          ]),
        ));
  }
}

class SuraDetail {
  String suraName;
  String suraNumber;

  SuraDetail(this.suraName, this.suraNumber);
}
