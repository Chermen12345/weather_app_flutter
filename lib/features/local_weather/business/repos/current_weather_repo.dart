import 'package:weather_app_flutter/data/models/current_weather.dart';

abstract class CurrentWeatherRepo {
  Future<LocalWeather> getCurrentWeather(String city);
}
