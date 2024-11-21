import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamii_app/cubit/radios_cubit.dart';
import 'package:provider/provider.dart';

import '../../../config/settings_provider.dart';

class RadioPageBody extends StatefulWidget {
  const RadioPageBody({super.key});

  @override
  State<RadioPageBody> createState() => _RadioPageBodyState();
}

class _RadioPageBodyState extends State<RadioPageBody> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var vm = Provider.of<SettingProvider>(context);
    var cubit = BlocProvider.of<RadiosCubit>(context);
    return
      Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('assets/images/radio_body.png'),
        Text(cubit.currentRadio!.name??"",
            style: vm.current_theme == ThemeMode.light
                ? theme.textTheme.bodyMedium
                : theme.textTheme.bodyMedium),
        const SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(onPressed: (){
              cubit.previousRadio();
            }, icon: Icon(
              Icons.skip_previous_rounded,
              size: 35,
              color: vm.current_theme == ThemeMode.light
                  ? theme.primaryColor
                  : Color(0xffFACC1D),
            )),
           IconButton(onPressed: (){
             cubit.clickOnPlay();
           },
               icon: cubit.isPlaying?
               const Icon(Icons.pause_rounded,size: 35,):
             Icon(Icons.play_arrow_rounded,
             size: 35,
             color: vm.current_theme == ThemeMode.light
                 ? theme.primaryColor
                 : Color(0xffFACC1D),
           ) ),
            IconButton(onPressed: (){
              cubit.nextRadio();
            }, icon: Icon(
              Icons.skip_next_rounded,
              size: 35,
              color: vm.current_theme == ThemeMode.light
                  ? theme.primaryColor
                  : Color(0xffFACC1D),
            ))
          ],
        )
      ],
    );
  }
}
