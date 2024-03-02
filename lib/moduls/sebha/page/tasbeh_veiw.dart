import 'dart:math';

import 'package:flutter/material.dart';

class TasbehView extends StatefulWidget {
  TasbehView({super.key});

  @override
  State<TasbehView> createState() => _TasbehViewState();
}

class _TasbehViewState extends State<TasbehView> {
  List<String> listOfAdiu = [
    "سبحان الله ",
    "الحمدلله",
    "الله اكبر ",
    "لا اله الا الله ",
    "لا حول ولا قوة الا بالله ",
    "اللهم صلي علي محمد ",
    "استغفر الله العظيم واتوب اليه "
  ];
  int numberTasbeh = 0;
  double angel = pi;
  int index = 0;

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    var theme = Theme.of(context);
    return GestureDetector(
      onTap: () {
        if (numberTasbeh == 33) {
          numberTasbeh = 0;
          index++;
          if (index == listOfAdiu.length) {
            index = 0;
          }
        } else {
          numberTasbeh++;
        }

        if (angel % 2 == pi) {
          angel = pi;
        } else {
          angel += (pi / 10);
        }
        setState(() {});
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Divider(
            color: Colors.transparent,
          ),
          Image.asset(
            "assets/images/head_sebha_logo@3x.png",
            height: mediaQuery.height * .12,
            fit: BoxFit.fill,
          ),
          Transform.rotate(
            angle: angel,
            child: Image.asset(
              "assets/images/body_sebha_logo@3x.png",
              width: mediaQuery.width * .4,
              height: mediaQuery.height * .2,
              fit: BoxFit.fill,
            ),
          ),
          const Text(
            "عدد التسبحات ",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 22, fontWeight: FontWeight.w700, color: Colors.black),
          ),
          Container(
            alignment: AlignmentDirectional.center,
            decoration: BoxDecoration(
              color: theme.primaryColor.withOpacity(.7),
              borderRadius: BorderRadius.circular(8),
            ),
            width: mediaQuery.width * .2,
            height: mediaQuery.width * .2,
            child: Text(
              numberTasbeh.toString(),
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          Container(
            alignment: AlignmentDirectional.center,
            decoration: BoxDecoration(
              color: theme.primaryColor,
              borderRadius: BorderRadius.circular(8),
            ),
            width: mediaQuery.width * .5,
            height: mediaQuery.height * .1,
            child: Text(
              listOfAdiu[index],
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
