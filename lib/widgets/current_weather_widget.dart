import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/model/weather_current.dart';
import 'package:weather_app/utils/custom_colors.dart';

class CurrentWeather extends StatelessWidget {
  final WeatherCurrent weatherCurrent;
  const CurrentWeather({super.key, required this.weatherCurrent});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        temperatureAreaWidget(),
        const SizedBox(height: 20),
        currentWeatherMoreDetailWidget(),
      ],
    );
  }

  Widget currentWeatherMoreDetailWidget() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: ["clouds", "humidity", "windspeed"]
              .map(
                (data) => Container(
                  height: 60,
                  width: 60,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: CustomColor.cardColor,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Image.asset('assets/icons/$data.png'),
                ),
              )
              .toList(),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              height: 20,
              width: 60,
              child: Text(
                "${weatherCurrent.current.windSpeed}km/h",
                style: GoogleFonts.poppins(fontSize: 15),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 20,
              width: 60,
              child: Text(
                "${weatherCurrent.current.clouds}%",
                style: GoogleFonts.poppins(fontSize: 15),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 20,
              width: 60,
              child: Text(
                "${weatherCurrent.current.humidity}%",
                style: GoogleFonts.poppins(fontSize: 15),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        )
      ],
    );
  }

  Widget temperatureAreaWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Image.asset(
          'assets/weather/${weatherCurrent.current.weather?[0].icon}.png',
          height: 80,
          width: 80,
        ),
        Container(
          height: 50,
          width: 1,
          color: CustomColor.dividerLine,
        ),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "${weatherCurrent.current.temp!.toInt()}°",
                style: GoogleFonts.poppins(
                  fontSize: 60,
                  fontWeight: FontWeight.w600,
                  color: CustomColor.textColorBlack,
                ),
              ),
              TextSpan(
                text: "${weatherCurrent.current.weather![0].main}",
                style: GoogleFonts.poppins(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
