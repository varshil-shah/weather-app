import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

import 'package:weather_app/model/weather_current.dart';
import 'package:weather_app/utils/custom_colors.dart';

class ComfortLevelWidget extends StatelessWidget {
  final WeatherCurrent weatherCurrent;
  const ComfortLevelWidget({super.key, required this.weatherCurrent});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin:
              const EdgeInsets.only(top: 1, right: 20, left: 20, bottom: 20),
          child: Text(
            "Comfort level",
            style: GoogleFonts.poppins(
              fontSize: 20,
              color: CustomColor.textColorBlack,
            ),
          ),
        ),
        SizedBox(
          height: 180,
          child: Column(
            children: [
              Center(
                child: SleekCircularSlider(
                  min: 0,
                  max: 100,
                  initialValue: weatherCurrent.current.humidity!.toDouble(),
                  appearance: CircularSliderAppearance(
                    animationEnabled: true,
                    spinnerDuration: 3000,
                    customWidths: CustomSliderWidths(
                      handlerSize: 0,
                      trackWidth: 12,
                      progressBarWidth: 12,
                    ),
                    infoProperties: InfoProperties(
                      mainLabelStyle: GoogleFonts.poppins(
                        fontSize: 34,
                        color: CustomColor.textColorBlack,
                      ),
                      bottomLabelText: "Humidity",
                      bottomLabelStyle: GoogleFonts.poppins(
                        letterSpacing: 0.1,
                        fontSize: 16,
                        height: 1.5,
                      ),
                    ),
                    customColors: CustomSliderColors(
                      hideShadow: true,
                      trackColor: CustomColor.firstGradientColor.withAlpha(100),
                      progressBarColors: [
                        CustomColor.firstGradientColor,
                        CustomColor.secondGradientColor,
                      ],
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  RichText(
                    text: TextSpan(
                      text: "Feels Like ${weatherCurrent.current.feelsLike}",
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        height: 1,
                        color: CustomColor.textColorBlack,
                      ),
                    ),
                  ),
                  Container(
                    height: 25,
                    width: 1,
                    color: CustomColor.dividerLine,
                  ),
                  RichText(
                    text: TextSpan(
                      text: "UV Index ${weatherCurrent.current.uvIndex}",
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        height: 1,
                        color: CustomColor.textColorBlack,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
