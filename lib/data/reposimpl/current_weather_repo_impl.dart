import 'package:get_it/get_it.dart';
import 'package:weather_app_flutter/data/models/current_weather.dart';
import 'package:weather_app_flutter/data/remote_data_source/remote_data_source.dart';
import 'package:weather_app_flutter/features/local_weather/business/repos/current_weather_repo.dart';

class CurrentWeatherRepoImpl implements CurrentWeatherRepo {
  @override
  Future<LocalWeather> getCurrentWeather(String city) async {
    return GetIt.I<RemoteDataSource>().getCurrentWeather(city);
  }
}
