import 'package:flutter/material.dart';
import 'package:weather_app_flutter/data/models/current_weather.dart';

class DetailCardNotLoaded extends StatelessWidget {
  const DetailCardNotLoaded({super.key});

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
                    SizedBox(
                      width: 50,
                      height: 50,
                      child: Image.asset(
                        "assets/windicon.png",
                        width: 50,
                        height: 50,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 5),
                      child: Text(
                        "--",
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  ],
                ),
              ),
              Column(
                children: [
                  SizedBox(
                    width: 50,
                    height: 50,
                    child: Image.asset(
                      "assets/cloudicon.png",
                      width: 50,
                      height: 50,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 5),
                    child: Text(
                      "--",
                      style: TextStyle(color: Colors.white),
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
                    const Padding(
                      padding: EdgeInsets.only(top: 5),
                      child: Text(
                        "--",
                        style: TextStyle(color: Colors.white),
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
                    SizedBox(
                      width: 50,
                      height: 50,
                      child: Image.asset(
                        "assets/pressureicon.png",
                        width: 50,
                        height: 50,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 5),
                      child: Text(
                        "--",
                        style: TextStyle(color: Colors.white),
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
                  const Padding(
                    padding: EdgeInsets.only(top: 5),
                    child: Text(
                      "--",
                      style: TextStyle(color: Colors.white),
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
                    const Padding(
                      padding: EdgeInsets.only(top: 5),
                      child: Text(
                        "--",
                        style: TextStyle(color: Colors.white),
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
