import 'package:flutter/material.dart';
import 'package:weather_app_flutter/data/models/current_weather.dart';

class DetailCard extends StatelessWidget {
  LocalWeather weather;
  DetailCard({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 30),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Theme.of(context).primaryColor),
        height: 240,
        width: double.infinity,
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Column(
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      child: Image.asset(
                        "assets/windicon.png",
                        width: 50,
                        height: 50,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Text(
                        "${weather.current.wind_mph}",
                        style: const TextStyle(color: Colors.white),
                      ),
                    )
                  ],
                ),
              ),
              Column(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    child: Image.asset(
                      "assets/cloudicon.png",
                      width: 50,
                      height: 50,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Text(
                      "${weather.current.cloud}%",
                      style: const TextStyle(color: Colors.white),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(right: 30),
                child: Column(
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      child: Image.asset(
                        "assets/humidicon.png",
                        width: 50,
                        height: 50,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Text(
                        "${weather.current.humidity}%",
                        style: const TextStyle(color: Colors.white),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Column(
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      child: Image.asset(
                        "assets/pressureicon.png",
                        width: 50,
                        height: 50,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Text(
                        "${weather.current.pressure_mb}",
                        style: const TextStyle(color: Colors.white),
                      ),
                    )
                  ],
                ),
              ),
              Column(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    child: Image.asset(
                      "assets/visicon.png",
                      width: 50,
                      height: 50,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Text(
                      "${weather.current.vis_km}",
                      style: const TextStyle(color: Colors.white),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(right: 30),
                child: Column(
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      child: Image.asset(
                        "assets/ficon.png",
                        width: 50,
                        height: 50,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Text(
                        "${weather.current.temp_f}",
                        style: const TextStyle(color: Colors.white),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
