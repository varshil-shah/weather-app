import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import 'package:weather_app/utils/custom_colors.dart';
import 'package:weather_app/controller/global_controller.dart';

class HeaderWidget extends StatefulWidget {
  const HeaderWidget({super.key});

  @override
  State<HeaderWidget> createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {
  String city = "";
  String date = DateFormat("yMMMMd").format(DateTime.now());
  final GlobalController globalController = Get.put(
    GlobalController(),
    permanent: true,
  );

  @override
  void initState() {
    getAddress(
      globalController.getLattitude().value,
      globalController.getLongitude().value,
    );
    super.initState();
  }

  getAddress(lat, long) async {
    List<Placemark> placemark = await placemarkFromCoordinates(lat, long);
    Placemark place = placemark[0];
    setState(() {
      city = place.locality!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 20, right: 20),
          alignment: Alignment.topLeft,
          child: Text(
            city,
            style: GoogleFonts.poppins(
              height: 2,
              fontSize: 35,
              fontWeight: FontWeight.w500,
              color: CustomColor.textColorBlack,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 20, right: 20),
          alignment: Alignment.topLeft,
          child: Text(
            date,
            style: GoogleFonts.poppins(
              height: 1.5,
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: CustomColor.textColorBlackOpacity,
            ),
          ),
        ),
      ],
    );
  }
}
