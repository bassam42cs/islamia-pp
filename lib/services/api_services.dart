import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../models/radio_response_body.dart';

class ApiService{
final _dio = Dio(
  BaseOptions(
    baseUrl: "https://mp3quran.net/api/v3",
  ),
);
ApiService(){
  _dio.interceptors.add(PrettyDioLogger(responseBody: false));
}
getRadio()async {
  var response = await _dio.get("/radios");
  //print(response.data);
  return response.data;
//    var response= await _apiService.getRadio();
//   if(response.statusCode==200){
//     var data = jsonDecode(response.data);
//
//     List radios =data["radios"];
//     RadioResponseBody radio =RadioResponseBody.fromJson(data);
//     return radio.radios??[];
// }
//   else {
//     throw Exception('Failed to load radios');
//   }
//   }
}
}