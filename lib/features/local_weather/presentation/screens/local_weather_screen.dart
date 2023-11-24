import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app_flutter/data/models/current_weather.dart';
import 'package:weather_app_flutter/features/local_weather/presentation/bloc/current_weather_bloc.dart';
import 'package:weather_app_flutter/features/local_weather/presentation/bloc/current_weather_event.dart';
import 'package:weather_app_flutter/features/local_weather/presentation/bloc/current_weather_state.dart';
import 'package:weather_app_flutter/features/local_weather/presentation/widgets/detail_card.dart';
import 'package:weather_app_flutter/features/local_weather/presentation/widgets/detail_card_not_loaded.dart';
import 'package:weather_app_flutter/features/local_weather/presentation/widgets/one_hourly_item.dart';
import 'package:weather_app_flutter/features/local_weather/presentation/widgets/one_hourly_not_loaded.dart';

class LocalWeatherScreen extends StatefulWidget {
  const LocalWeatherScreen({super.key});

  @override
  State<LocalWeatherScreen> createState() => _LocalWeatherScreenState();
}

class _LocalWeatherScreenState extends State<LocalWeatherScreen> {
  String current_city = "";
  final CurrentWeatherBloc _bloc = CurrentWeatherBloc();
  Future<String> getCurrentCity() async {
    LocationPermission perm = await Geolocator.checkPermission();

    if (perm == LocationPermission.denied) {
      perm = await Geolocator.requestPermission();
    }
    Position pos = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    List<Placemark> place_marks =
        await placemarkFromCoordinates(pos.latitude, pos.longitude);
    String? city = place_marks[0].locality;
    return city ?? "";
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getCurrentCity().then((city) {
      _bloc.add(LoadCurrentWeather(city));

      setState(() {
        current_city = city;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Theme.of(context).primaryColor,
            Theme.of(context).secondaryHeaderColor
          ],
        )),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 20),
                child: Text("${current_city}",
                    style:
                        GoogleFonts.aBeeZee(color: Colors.white, fontSize: 20)),
              ),
              Row(
                children: [
                  BlocBuilder<CurrentWeatherBloc, CurrentWeatherState>(
                    bloc: _bloc,
                    builder: (context, state) {
                      if (state is CurrentWeatherLoaded) {
                        return Padding(
                            padding: const EdgeInsets.only(
                                left: 15, top: 30, right: 10),
                            child: getCurrentAnimation(state.weather));
                      }
                      return const SizedBox(
                        width: 150,
                        height: 150,
                      );
                    },
                  ),
                  Column(
                    children: [
                      BlocBuilder<CurrentWeatherBloc, CurrentWeatherState>(
                        bloc: _bloc,
                        builder: (context, state) {
                          if (state is CurrentWeatherLoaded) {
                            return Padding(
                              padding: const EdgeInsets.only(top: 20, left: 20),
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  "${state.weather.current.temp_c.toInt()} °C",
                                  style: GoogleFonts.aBeeZee(
                                      color: Colors.white, fontSize: 64),
                                ),
                              ),
                            );
                          }
                          return Padding(
                            padding: const EdgeInsets.only(top: 20, left: 20),
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                "-- °C",
                                style: GoogleFonts.aBeeZee(
                                    color: Colors.white, fontSize: 64),
                              ),
                            ),
                          );
                        },
                      ),
                      BlocBuilder<CurrentWeatherBloc, CurrentWeatherState>(
                        bloc: _bloc,
                        builder: (context, state) {
                          if (state is CurrentWeatherLoaded) {
                            return Padding(
                              padding: const EdgeInsets.only(top: 10, left: 20),
                              child: Text(
                                "${state.weather.current.condition.text}",
                                style: GoogleFonts.aBeeZee(
                                    color: Colors.white, fontSize: 24),
                              ),
                            );
                          }
                          return Padding(
                            padding: const EdgeInsets.only(top: 10, left: 20),
                            child: Text(
                              "...",
                              style: GoogleFonts.aBeeZee(
                                  color: Colors.white, fontSize: 24),
                            ),
                          );
                        },
                      )
                    ],
                  )
                ],
              ),
              BlocBuilder<CurrentWeatherBloc, CurrentWeatherState>(
                bloc: _bloc,
                builder: (context, state) {
                  if (state is CurrentWeatherLoaded) {
                    return DetailCard(
                      weather: state.weather,
                    );
                  }
                  return const DetailCardNotLoaded();
                },
              ),
              Padding(
                padding: EdgeInsets.only(top: 30),
                child: SizedBox(
                  width: double.infinity,
                  height: 210,
                  child: BlocBuilder<CurrentWeatherBloc, CurrentWeatherState>(
                    bloc: _bloc,
                    builder: (context, state) {
                      if (state is CurrentWeatherLoaded) {
                        return ListView.builder(
                            itemCount: state
                                .weather.forecast.forecastday[0].hour.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, i) {
                              return OneHourlyItem(
                                hour: state
                                    .weather.forecast.forecastday[0].hour[i],
                              );
                            });
                      }
                      return ListView.builder(
                          itemCount: 10,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, i) {
                            return const OneHourlyNotLoaded();
                          });
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget getCurrentAnimation(LocalWeather weather) {
    switch (weather.current.condition.text) {
      case "Sunny":
        return Lottie.asset("assets/sunny.json", width: 150, height: 150);
      case "Partly cloudy":
        return Lottie.asset("assets/partlycloud.json", width: 150, height: 150);
      case "Cloudy":
        return Lottie.asset("assets/cloud.json", width: 150, height: 150);
      case "Overcast":
        return Lottie.asset("assets/cloud.json", width: 150, height: 150);
      case "Mist":
        return Lottie.asset("assets/rain.json", width: 150, height: 150);
      case "Patchy rain possible":
        return Lottie.asset("assets/rain.json", width: 150, height: 150);
      case "Patchy snow possible":
        return Lottie.asset("assets/rain.json", width: 150, height: 150);
      case "Fog":
        return Lottie.asset("assets/mist.json", width: 150, height: 150);
      case "Moderate rain":
        return Lottie.asset("assets/rain.json", width: 150, height: 150);
      case "Clear":
        return Lottie.asset("assets/sunny.json", width: 150, height: 150);
      case "Light rain shower":
        return Lottie.asset("assets/rain.json", width: 150, height: 150);

      default:
        return Center();
    }
  }
}
