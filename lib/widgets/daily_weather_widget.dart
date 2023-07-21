import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/model/weather_daily.dart';
import 'package:weather_app/utils/custom_colors.dart';

class DailyWeatherWidget extends StatelessWidget {
  final WeatherDaily weatherDaily;
  const DailyWeatherWidget({super.key, required this.weatherDaily});

  String getDay(final int day) {
    DateTime time = DateTime.fromMillisecondsSinceEpoch(day * 1000);
    final String readableDay = DateFormat("EEE").format(time);
    return readableDay;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: CustomColor.cardColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            margin: const EdgeInsets.only(bottom: 10),
            child: Text(
              "Next days",
              style: GoogleFonts.poppins(
                fontSize: 18,
                color: CustomColor.textColorBlack,
              ),
            ),
          ),
          dailyList(),
        ],
      ),
    );
  }

  Widget dailyList() {
    return SizedBox(
      height: 300,
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount:
            weatherDaily.daily.length > 7 ? 7 : weatherDaily.daily.length,
        itemBuilder: (ctx, index) {
          return Column(
            children: [
              Container(
                height: 60,
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: 80,
                      child: Text(
                        getDay(weatherDaily.daily[index].dt!),
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          color: CustomColor.textColorBlack,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                      width: 40,
                      child: Image.asset(
                        'assets/weather/${weatherDaily.daily[index].weather![0].icon}.png',
                      ),
                    ),
                    Text(
                      "${weatherDaily.daily[index].temp!.min}°/${weatherDaily.daily[index].temp!.max}°",
                    )
                  ],
                ),
              ),
              Container(
                height: 1,
                color: CustomColor.dividerLine,
              )
            ],
          );
        },
      ),
    );
  }
}
