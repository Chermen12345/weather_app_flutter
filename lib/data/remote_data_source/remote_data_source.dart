import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:weather_app_flutter/core/consts/const.dart';
import 'package:weather_app_flutter/data/models/current_weather.dart';

abstract class RemoteDataSource {
  Future<LocalWeather> getCurrentWeather(String city);
}

class RemoteDataSourceImpl implements RemoteDataSource {
  @override
  Future<LocalWeather> getCurrentWeather(String city) async {
    final response =
        await Dio().get("${BASE_URL}${END_POINT}?key=${API_KEY}&q=${city}");
    final body = response.data;
    final local_weather = LocalWeather.fromJson(body);
    debugPrint(local_weather.toJson().toString());
    return local_weather;
  }
}
