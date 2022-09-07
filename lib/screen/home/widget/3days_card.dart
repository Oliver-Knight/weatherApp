import 'package:calculator_app/modal/weather_modal.dart';
import 'package:calculator_app/util/extension.dart';
import 'package:calculator_app/util/theme.dart';
import 'package:calculator_app/util/weather_icon.dart';
import 'package:flutter/material.dart';

class ThreeDayForecastCard extends StatelessWidget {
  WeatherModal modal;
  ThreeDayForecastCard({Key? key, required this.modal}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String time = modal.time;
    double temp = modal.tempC;
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: 5.0.wp(context), vertical: 3.0.hp(context)),
      width: 35.0.wp(context),
      decoration: BoxDecoration(
          color: mainColor,
          boxShadow: [
            BoxShadow(
                offset: const Offset(4, 4),
                color: secondaryColor,
                spreadRadius: 1,
                blurRadius: 15),
            BoxShadow(
                color: whiteColor,
                offset: const Offset(-4, -4),
                spreadRadius: 1,
                blurRadius: 15)
          ],
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(8),
              bottomRight: Radius.circular(20),
              bottomLeft: Radius.circular(8))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(time,
              style: TextStyle(fontSize: 13.0.sp(context), color: textColor)),
          modal.isday
              ? Image(image: AssetImage(WeatherIcon.weatherIcon[modal.code]))
              : Image(
                  image: AssetImage(WeatherIcon.weatherIcon[modal.code + 1] ??
                      WeatherIcon.weatherIcon[modal.code])),
          Text(
            "$temp°",
            style: TextStyle(fontSize: 12.0.sp(context), color: textColor),
          ),
          Text(
            modal.weatherCondition,
            style: TextStyle(fontSize: 12.0.sp(context), color: textColor),
          ),
        ],
      ),
    );
  }
}
