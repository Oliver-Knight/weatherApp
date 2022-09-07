import 'dart:developer';

import 'package:calculator_app/modal/weather_modal.dart';
import 'package:dio/dio.dart';

class ApiService {
    Dio dio = Dio();
    Future<WeatherModal> getData(String country)async{
      try {
        Response response = await dio.get("http://api.weatherapi.com/v1/current.json?key=6ab5a7fc5ac340ff94d84356220509&q=$country&aqi=no");
        log("${response.data['current']['temp_c']}");
        WeatherModal result = WeatherModal.fromJson(response.data);
        log(result.toString());
        return result;
      } on DioError catch(e) {
        log("error : ${e.response?.statusCode}");
        throw Exception("Failed to load");
      }
    }

    Future<List<WeatherModal>> oneDayForcestData(String country)async{
      List<WeatherModal> result = [];
      Response response = await dio.get("http://api.weatherapi.com/v1/forecast.json?key=6ab5a7fc5ac340ff94d84356220509&q=$country&days=1&aqi=no&alerts=no");
      for(int i=0; i < 24 ; i++){
        WeatherModal dataModal = WeatherModal.dayFromJson(response.data, i);
        result.add(dataModal);
      }
      
      return result;
    }

    Future<List<WeatherModal>> threeDayForecastData(String country)async{
      List<WeatherModal> result = [];
      Response response = await dio.get("http://api.weatherapi.com/v1/forecast.json?key=6ab5a7fc5ac340ff94d84356220509 &q=$country&days=3&aqi=no&alerts=no");
      for(int i=0; i < 3; i++){
        WeatherModal dataModal = WeatherModal.threeDayForecastData(response.data, i);
        result.add(dataModal);
      }
      log(result.toString());
      return result;
    }
}