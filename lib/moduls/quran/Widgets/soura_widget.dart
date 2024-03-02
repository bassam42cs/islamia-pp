import 'package:flutter/material.dart';

class Sura extends StatelessWidget {
  const Sura({super.key, required this.suraName, required this.suraNumber});

  final String suraName, suraNumber;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Row(
      children: [
        Expanded(
          child: Text(
            suraNumber,
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontSize: 25, fontWeight: FontWeight.w500, color: Colors.black),
          ),
        ),
        Container(
          color: theme.primaryColor,
          height: 38,
          width: 1.5,
        ),
        Expanded(
          child: Text(
            suraName,
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontSize: 25, fontWeight: FontWeight.w500, color: Colors.black),
          ),
        ),
      ],
    );
  }
}
