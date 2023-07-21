import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/controller/global_controller.dart';
import 'package:weather_app/utils/custom_colors.dart';
import 'package:weather_app/widgets/comfort_level_widget.dart';
import 'package:weather_app/widgets/current_weather_widget.dart';
import 'package:weather_app/widgets/daily_weather_widget.dart';
import 'package:weather_app/widgets/header_widget.dart';
import 'package:weather_app/widgets/hourly_weather_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalController globalController = Get.put(
    GlobalController(),
    permanent: true,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(
          () => globalController.checkLoading().isTrue
              ? Center(
                  child: Image.asset(
                    'assets/icons/clouds.png',
                    height: 300,
                    width: 300,
                  ),
                )
              : ListView(
                  scrollDirection: Axis.vertical,
                  children: [
                    const SizedBox(height: 20),
                    const HeaderWidget(),
                    CurrentWeather(
                      weatherCurrent:
                          globalController.getWeatherData().getCurrentWeather(),
                    ),
                    const SizedBox(height: 20),
                    HourlyWeatherWidget(
                      weatherHourly:
                          globalController.getWeatherData().getHourlyWeather(),
                    ),
                    DailyWeatherWidget(
                      weatherDaily:
                          globalController.getWeatherData().getDailyWeather(),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      child: const Divider(
                        color: CustomColor.dividerLine,
                      ),
                    ),
                    const SizedBox(height: 20),
                    ComfortLevelWidget(
                      weatherCurrent:
                          globalController.getWeatherData().getCurrentWeather(),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
