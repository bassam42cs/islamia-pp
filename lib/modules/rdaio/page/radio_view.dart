import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamii_app/config/settings_provider.dart';
import 'package:islamii_app/cubit/radios_cubit.dart';
import 'package:islamii_app/modules/rdaio/Widget/radio_page_body.dart';
import 'package:islamii_app/services/api_services.dart';
import 'package:provider/provider.dart';

class RadioView extends StatelessWidget {
  const RadioView({super.key});

  @override
  Widget build(BuildContext context) {
    //ApiService().getRadio();
    var theme = Theme.of(context);
    var vm = Provider.of<SettingProvider>(context);
    return BlocProvider(create: (context) => RadiosCubit()..getRadios(),
    child: BlocBuilder<RadiosCubit,RadiosState>(
      builder: (context, state) {
        switch(state) {
          case RadiosInitial():
            return const Center(child: CircularProgressIndicator(),);
          case RadiosSuccess():
            return RadioPageBody();
          case RadiosError():
            return Text(state.error);
        }
      },
    ));
  }
}
