import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import 'package:weather_app/controller/global_controller.dart';
import 'package:weather_app/model/weather_hourly.dart';
import 'package:weather_app/utils/custom_colors.dart';

// ignore: must_be_immutable
class HourlyWeatherWidget extends StatelessWidget {
  final WeatherHourly weatherHourly;
  HourlyWeatherWidget({super.key, required this.weatherHourly});

  RxInt cardIndex = GlobalController().getIndex();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
          alignment: Alignment.topLeft,
          child: Text(
            "Today",
            style: GoogleFonts.poppins(
              fontSize: 18,
              color: CustomColor.textColorBlack,
            ),
          ),
        ),
        hourlyList(),
      ],
    );
  }

  Widget hourlyList() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      height: 160,
      padding: const EdgeInsets.only(bottom: 10, top: 10),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount:
            weatherHourly.hourly.length > 12 ? 12 : weatherHourly.hourly.length,
        itemBuilder: (context, index) {
          return Obx(
            () => GestureDetector(
              onTap: () {
                cardIndex.value = index;
              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  gradient: cardIndex.value == index
                      ? const LinearGradient(
                          colors: [
                            CustomColor.firstGradientColor,
                            CustomColor.secondGradientColor,
                          ],
                        )
                      : null,
                  color: CustomColor.cardColor,
                ),
                child: HourlyDetails(
                  isCurrentCard: index == cardIndex.value,
                  timeStamp: weatherHourly.hourly[index].dt!,
                  temp: weatherHourly.hourly[index].temp!,
                  iconName: weatherHourly.hourly[index].weather![0].icon!,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

// ignore: must_be_immutable
class HourlyDetails extends StatelessWidget {
  int timeStamp;
  int temp;
  bool isCurrentCard;
  String iconName;

  String getTime(int ts) {
    DateTime time = DateTime.fromMillisecondsSinceEpoch(ts * 1000);
    String readableTime = DateFormat("jm").format(time);
    return readableTime;
  }

  HourlyDetails({
    super.key,
    required this.isCurrentCard,
    required this.timeStamp,
    required this.temp,
    required this.iconName,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 10),
          child: Text(
            getTime(timeStamp),
            style: GoogleFonts.poppins(
              color: isCurrentCard ? Colors.white : CustomColor.textColorBlack,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.all(5),
          child: Image.asset(
            'assets/weather/$iconName.png',
            height: 50,
            width: 50,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 10),
          child: Text(
            '$temp°',
            style: GoogleFonts.poppins(
              color: isCurrentCard ? Colors.white : CustomColor.textColorBlack,
            ),
          ),
        )
      ],
    );
  }
}
