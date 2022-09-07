import 'dart:ffi';

class WeatherModal {
  String name;
  String country;
  double lat;
  double lon;
  String time;
  dynamic tempC;
  dynamic tempF;
  bool isday;
  String weatherCondition;
  int code;
  dynamic windDir;
  double pressureIn;
  int? humidity;
  double? windy;
  WeatherModal(
      {required this.name,
      required this.country,
      required this.lat,
      required this.lon,
      required this.time,
      required this.tempC,
      required this.tempF,
      required this.isday,
      required this.weatherCondition,
      required this.code,
      required this.windDir,
      required this.pressureIn,
      this.humidity,
      this.windy});

  factory WeatherModal.fromJson(Map<String, dynamic> data) {
    return WeatherModal(
        name: data['location']['name'],
        country: data['location']['country'],
        lat: data['location']['lat'],
        lon: data['location']['lon'],
        time: data['location']['localtime'],
        tempC: data['current']['temp_c'],
        tempF: data['current']['temp_f'],
        isday: data['current']['isday'] == 1 ? true : false,
        weatherCondition: data['current']['condition']['text'],
        code: data['current']['condition']['code'],
        windDir: data['current']['wind_mph'],
        pressureIn: data['current']['pressure_mb'],
        humidity: data['current']['humidity'],
        windy: data['current']['gust_mph']
        );
  }

  factory WeatherModal.dayFromJson(Map<String,dynamic> data, index){
    return WeatherModal(name: data['location']['name'],
        country: data['location']['country'],
        lat: data['location']['lat'],
        lon: data['location']['lon'],
        time: data['forecast']['forecastday'][0]['hour'][index]['time'], 
        tempC: data['forecast']['forecastday'][0]['hour'][index]['temp_c'],
        tempF: data['forecast']['forecastday'][0]['hour'][index]['temp_f'],
        isday: data['forecast']['forecastday'][0]['hour'][index]['is_day'] == 1 ? true : false,
        weatherCondition: data['forecast']['forecastday'][0]['hour'][index]['condition']['text'],
        code: data['forecast']['forecastday'][0]['hour'][index]['condition']['code'],
        windDir: data['forecast']['forecastday'][0]['hour'][index]['wind_dir'],
        pressureIn: data['forecast']['forecastday'][0]['hour'][index]['pressure_in']);
  }

    factory WeatherModal.threeDayForecastData(
      Map<String, dynamic> data, int index) {
    return WeatherModal(
      name: data['location']['name'],
      country: data['location']['country'],
      lat: data['location']['lat'],
      lon: data['location']['lon'],
      time: data['forecast']['forecastday'][index]['date'],
      tempC: data['forecast']['forecastday'][index]['day']['maxtemp_c'],
      tempF: data['forecast']['forecastday'][index]['day']['maxtemp_f'],
      isday: data['current']['isday'] == 1 ? true : false,
      weatherCondition: data['forecast']['forecastday'][index]['day']
          ['condition']['text'],
      code: data['forecast']['forecastday'][index]['day']['condition']['code'],
      windDir: data['forecast']['forecastday'][index]['day']['maxwind_mph'].toString(),
      pressureIn: double.parse(data['forecast']['forecastday'][index]['day']
          ['daily_chance_of_rain'].toString()),
    );
  }
}
