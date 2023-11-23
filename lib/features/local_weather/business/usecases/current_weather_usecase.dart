import 'package:get_it/get_it.dart';
import 'package:weather_app_flutter/data/models/current_weather.dart';
import 'package:weather_app_flutter/features/local_weather/business/repos/current_weather_repo.dart';

class CurrentWeatherUseCase {
  Future<LocalWeather> getCurrentWeather(String city) async {
    return GetIt.I<CurrentWeatherRepo>().getCurrentWeather(city);
  }
}
