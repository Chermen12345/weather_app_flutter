import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:weather_app_flutter/data/remote_data_source/remote_data_source.dart';
import 'package:weather_app_flutter/data/reposimpl/current_weather_repo_impl.dart';
import 'package:weather_app_flutter/features/local_weather/business/repos/current_weather_repo.dart';
import 'package:weather_app_flutter/features/local_weather/business/usecases/current_weather_usecase.dart';
import 'package:weather_app_flutter/features/local_weather/presentation/screens/local_weather_screen.dart';
import 'package:weather_app_flutter/navigation/routes.dart';
import 'package:weather_app_flutter/theme/app_theme.dart';

void main() {
  GetIt.I.registerSingleton<RemoteDataSource>(RemoteDataSourceImpl());
  GetIt.I.registerSingleton<CurrentWeatherRepo>(CurrentWeatherRepoImpl());
  GetIt.I.registerSingleton(CurrentWeatherUseCase());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: app_theme,
      routes: app_route,
    );
  }
}
