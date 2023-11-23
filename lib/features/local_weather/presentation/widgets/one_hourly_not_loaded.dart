import 'package:flutter/material.dart';
import 'package:weather_app_flutter/data/models/current_weather.dart';

class OneHourlyNotLoaded extends StatelessWidget {
  const OneHourlyNotLoaded({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8),
      child: Container(
          height: 210,
          width: 126,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Theme.of(context).primaryColor)),
    );
  }
}
