import 'dart:convert';

import 'package:audioplayers/audioplayers.dart';
import 'package:bloc/bloc.dart';
import 'package:islamii_app/models/radio_response_body.dart';
import 'package:islamii_app/services/api_services.dart';
import 'package:meta/meta.dart';

part 'radios_state.dart';

class RadiosCubit extends Cubit<RadiosState> {
  final ApiService _apiService = ApiService();
  List<RadiosModel>? radios;
  RadiosModel? currentRadio ;
  bool isPlaying = false;
  int currentIndex = 0;
  final player = AudioPlayer();
  RadiosCubit() : super(RadiosInitial());
  getRadios() async {
    try {
       emit(RadiosInitial());
      // final radio = await _apiService.getRadio();
      // emit(RadiosSuccess(radio));
      var response = await _apiService.getRadio();
      var data =RadioResponseBody.fromJson(response);
      radios = data.radios;
      currentRadio = radios![currentIndex];
      emit(RadiosSuccess());
    } catch (error) {
      emit(RadiosError(error.toString()));
    }
  }
  previousRadio(){
    if(currentIndex ==0 ) return;
    player.stop();
    isPlaying = false;

    currentIndex--;
    currentRadio = radios![currentIndex];
    emit(RadiosSuccess());
  }
  nextRadio(){
    if(currentIndex == radios!.length-1) return;
    player.stop();
    isPlaying = false;

    currentIndex++;
    currentRadio = radios![currentIndex];
    emit(RadiosSuccess());
  }
  clickOnPlay() {
    if (player.state == PlayerState.playing) {
      isPlaying = false;
      player.pause();
    }
    else if (player.state == PlayerState.paused) {
      isPlaying = true;
      player.resume();
    }
    else {
      isPlaying = true;
      player.play(UrlSource(currentRadio!.url!));
    }
    emit(RadiosSuccess());
  }
}

