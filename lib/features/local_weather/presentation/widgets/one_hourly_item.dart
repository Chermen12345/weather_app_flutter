import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app_flutter/data/models/current_weather.dart';

class OneHourlyItem extends StatelessWidget {
  Hour hour;
  OneHourlyItem({super.key, required this.hour});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8),
      child: Container(
        height: 210,
        width: 126,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Theme.of(context).primaryColor),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              getCurrentAnimation(hour),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Text(
                  "${hour.temp_c.toInt()} °С",
                  style: GoogleFonts.aBeeZee(color: Colors.white, fontSize: 15),
                ),
              ),
              Text(
                "${hour.time}",
                style: GoogleFonts.aBeeZee(color: Colors.white, fontSize: 11),
              )
            ]),
      ),
    );
  }

  Widget getCurrentAnimation(Hour hour) {
    switch (hour.condition.text) {
      case "Sunny":
        return Lottie.asset("assets/sunny.json", width: 50, height: 50);
      case "Partly cloudy":
        return Lottie.asset("assets/partlycloud.json", width: 50, height: 50);
      case "Cloudy":
        return Lottie.asset("assets/cloud.json", width: 50, height: 50);
      case "Overcast":
        return Lottie.asset("assets/cloud.json", width: 50, height: 50);
      case "Mist":
        return Lottie.asset("assets/rain.json", width: 50, height: 50);
      case "Patchy rain possible":
        return Lottie.asset("assets/rain.json", width: 50, height: 50);
      case "Patchy snow possible":
        return Lottie.asset("assets/rain.json", width: 50, height: 50);
      case "Fog":
        return Lottie.asset("assets/mist.json", width: 50, height: 50);
      case "Moderate rain":
        return Lottie.asset("assets/rain.json", width: 50, height: 50);
      case "Clear":
        return Lottie.asset("assets/sunny.json", width: 50, height: 50);
      case "Light rain shower":
        return Lottie.asset("assets/rain.json", width: 50, height: 50);

      default:
        return Center();
    }
  }
}
