import 'package:weather_app_flutter/data/models/current_weather.dart';

abstract class CurrentWeatherState {}

class CurrentWeatherInitial extends CurrentWeatherState {}

class CurrentWeatherLoading extends CurrentWeatherState {}

class CurrentWeatherLoaded extends CurrentWeatherState {
  LocalWeather weather;
  CurrentWeatherLoaded(this.weather);
}

class CurrentWeatherFailure extends CurrentWeatherState {
  Object? fail;
  CurrentWeatherFailure(this.fail);
}
