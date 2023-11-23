// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocalWeather _$LocalWeatherFromJson(Map<String, dynamic> json) => LocalWeather(
      CurrentWeather.fromJson(json['current'] as Map<String, dynamic>),
      Forecast.fromJson(json['forecast'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LocalWeatherToJson(LocalWeather instance) =>
    <String, dynamic>{
      'current': instance.current,
      'forecast': instance.forecast,
    };

CurrentWeather _$CurrentWeatherFromJson(Map<String, dynamic> json) =>
    CurrentWeather(
      (json['temp_c'] as num).toDouble(),
      (json['temp_f'] as num).toDouble(),
      (json['wind_mph'] as num).toDouble(),
      json['humidity'] as int,
      json['cloud'] as int,
      (json['pressure_mb'] as num).toDouble(),
      (json['vis_km'] as num).toDouble(),
      Condition.fromJson(json['condition'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CurrentWeatherToJson(CurrentWeather instance) =>
    <String, dynamic>{
      'temp_c': instance.temp_c,
      'temp_f': instance.temp_f,
      'wind_mph': instance.wind_mph,
      'humidity': instance.humidity,
      'cloud': instance.cloud,
      'pressure_mb': instance.pressure_mb,
      'vis_km': instance.vis_km,
      'condition': instance.condition,
    };

Condition _$ConditionFromJson(Map<String, dynamic> json) => Condition(
      json['text'] as String,
      json['icon'] as String,
    );

Map<String, dynamic> _$ConditionToJson(Condition instance) => <String, dynamic>{
      'text': instance.text,
      'icon': instance.icon,
    };

Forecast _$ForecastFromJson(Map<String, dynamic> json) => Forecast(
      (json['forecastday'] as List<dynamic>)
          .map((e) => ForecastDay.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ForecastToJson(Forecast instance) => <String, dynamic>{
      'forecastday': instance.forecastday,
    };

ForecastDay _$ForecastDayFromJson(Map<String, dynamic> json) => ForecastDay(
      (json['hour'] as List<dynamic>)
          .map((e) => Hour.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ForecastDayToJson(ForecastDay instance) =>
    <String, dynamic>{
      'hour': instance.hour,
    };

Hour _$HourFromJson(Map<String, dynamic> json) => Hour(
      json['time'] as String,
      (json['temp_c'] as num).toDouble(),
      Condition.fromJson(json['condition'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$HourToJson(Hour instance) => <String, dynamic>{
      'time': instance.time,
      'temp_c': instance.temp_c,
      'condition': instance.condition,
    };
