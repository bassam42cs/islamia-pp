import 'package:flutter/material.dart';

class RadioView extends StatelessWidget {
  const RadioView({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    var theme = Theme.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Image.asset(
          "assets/images/radio_image@3x.png",
          width: mediaQuery.width * .5,
          fit: BoxFit.fill,
        ),
        const Text(
          " إذاعة القراّّن الكريم ",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
            color: Color(0xff070707),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.fast_forward,
                size: 40,
                color: theme.primaryColor,
              ),
            ),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.pause_circle_filled,
                  size: 40,
                  color: theme.primaryColor,
                )),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.fast_rewind,
                  size: 40,
                  color: theme.primaryColor,
                )),
          ],
        )
      ],
    );
  }
}
