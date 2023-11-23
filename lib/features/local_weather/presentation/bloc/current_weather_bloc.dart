import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:weather_app_flutter/features/local_weather/business/usecases/current_weather_usecase.dart';
import 'package:weather_app_flutter/features/local_weather/presentation/bloc/current_weather_event.dart';
import 'package:weather_app_flutter/features/local_weather/presentation/bloc/current_weather_state.dart';

class CurrentWeatherBloc
    extends Bloc<CurrentWeatherEvent, CurrentWeatherState> {
  CurrentWeatherBloc() : super(CurrentWeatherInitial()) {
    on<LoadCurrentWeather>((event, emit) async {
      try {
        emit(CurrentWeatherLoading());
        final weather = await GetIt.I<CurrentWeatherUseCase>()
            .getCurrentWeather(event.city);
        emit(CurrentWeatherLoaded(weather));
      } catch (e) {
        emit(CurrentWeatherFailure(e));
      }
    });
  }
}
