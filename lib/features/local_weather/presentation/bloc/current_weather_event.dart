abstract class CurrentWeatherEvent {}

class LoadCurrentWeather extends CurrentWeatherEvent {
  String city;
  LoadCurrentWeather(this.city);
}
