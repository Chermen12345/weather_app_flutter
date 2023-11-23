import 'package:weather_app_flutter/features/local_weather/presentation/screens/local_weather_screen.dart';
import 'package:weather_app_flutter/features/other_city_weather/presentation/screens/search_weather_screen.dart';

final app_route = {
  '/': (context) => LocalWeatherScreen(),
  '/searchWeather': (context) => SearchWeatherScreen()
};
