import 'package:json_annotation/json_annotation.dart';

part 'current_weather.g.dart';

@JsonSerializable()
class LocalWeather {
  CurrentWeather current;
  Forecast forecast;

  LocalWeather(this.current, this.forecast);
  factory LocalWeather.fromJson(Map<String, dynamic> json) =>
      _$LocalWeatherFromJson(json);

  Map<String, dynamic> toJson() => _$LocalWeatherToJson(this);
}

@JsonSerializable()
class CurrentWeather {
  double temp_c;
  double temp_f;
  double wind_mph;
  int humidity;
  int cloud;
  double pressure_mb;
  double vis_km;
  Condition condition;
  CurrentWeather(this.temp_c, this.temp_f, this.wind_mph, this.humidity,
      this.cloud, this.pressure_mb, this.vis_km, this.condition);
  factory CurrentWeather.fromJson(Map<String, dynamic> json) =>
      _$CurrentWeatherFromJson(json);

  Map<String, dynamic> toJson() => _$CurrentWeatherToJson(this);
}

@JsonSerializable()
class Condition {
  String text;
  String icon;
  Condition(this.text, this.icon);

  factory Condition.fromJson(Map<String, dynamic> json) =>
      _$ConditionFromJson(json);

  Map<String, dynamic> toJson() => _$ConditionToJson(this);
}

@JsonSerializable()
class Forecast {
  List<ForecastDay> forecastday;
  Forecast(this.forecastday);

  factory Forecast.fromJson(Map<String, dynamic> json) =>
      _$ForecastFromJson(json);

  Map<String, dynamic> toJson() => _$ForecastToJson(this);
}

@JsonSerializable()
class ForecastDay {
  List<Hour> hour;
  ForecastDay(this.hour);

  factory ForecastDay.fromJson(Map<String, dynamic> json) =>
      _$ForecastDayFromJson(json);

  Map<String, dynamic> toJson() => _$ForecastDayToJson(this);
}

@JsonSerializable()
class Hour {
  String time;
  double temp_c;
  Condition condition;
  Hour(this.time, this.temp_c, this.condition);

  factory Hour.fromJson(Map<String, dynamic> json) => _$HourFromJson(json);

  Map<String, dynamic> toJson() => _$HourToJson(this);
}
