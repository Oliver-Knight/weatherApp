import 'package:calculator_app/modal/weather_modal.dart';
import 'package:calculator_app/screen/home/widget/3days_card.dart';
import 'package:calculator_app/screen/home/widget/7days_card.dart';
import 'package:calculator_app/util/extension.dart';
import 'package:calculator_app/util/global.dart';
import 'package:calculator_app/util/theme.dart';
import 'package:calculator_app/util/weather_icon.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _country = "";
  double _heigh = 40.0;
  double _width = 80.0;
  @override
  Widget build(BuildContext context) {
    FocusNode _nameF = FocusNode();
    TextEditingController _nameC = TextEditingController();
    bool _isSearch = false;
    return SafeArea(
      child: Scaffold(
          backgroundColor: mainColor,
          body: FutureBuilder<WeatherModal>(
              future: apiService.getData(_country == "" ? "yangon" : _country),
              builder: (context, snapshot) {
                return ListView(
                  children: [
                    SizedBox(
                      height: 1.0.hp(context),
                    ),
                    StatefulBuilder(builder: (context, myState) {
                      return _isSearch
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  padding:
                                      EdgeInsets.only(bottom: 1.0.hp(context)),
                                  alignment: Alignment.topCenter,
                                  margin:
                                      EdgeInsets.only(left: 5.0.wp(context)),
                                  width: 70.0.wp(context),
                                  height: 5.0.hp(context),
                                  decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(8)),
                                      boxShadow: [
                                        BoxShadow(
                                            color: secondaryColor,
                                            offset: const Offset(4, 4),
                                            blurRadius: 8,
                                            spreadRadius: 1,
                                            inset: true),
                                        BoxShadow(
                                            color: whiteColor,
                                            offset: const Offset(-4, -4),
                                            blurRadius: 10,
                                            spreadRadius: 1,
                                            inset: true)
                                      ]),
                                  child: TextField(
                                    style: TextStyle(color: textColor),
                                    cursorColor: textColor,
                                    focusNode: _nameF,
                                    controller: _nameC,
                                    decoration: InputDecoration(
                                        suffixIcon: IconButton(
                                            splashRadius: 1,
                                            onPressed: () {
                                              myState(
                                                  () => _isSearch = !_isSearch);
                                            },
                                            icon: Icon(
                                              Icons.close,
                                              color: textColor,
                                            )),
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                            borderRadius:
                                                BorderRadius.circular(8))),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      _country = _nameC.text;
                                    });
                                  },
                                  child: Container(
                                    margin:
                                        EdgeInsets.only(right: 5.0.wp(context)),
                                    height: 5.0.hp(context),
                                    width: 10.0.wp(context),
                                    decoration: BoxDecoration(
                                        color: mainColor,
                                        shape: BoxShape.circle,
                                        boxShadow: [
                                          BoxShadow(
                                            color: secondaryColor,
                                            offset: const Offset(4, 4),
                                            blurRadius: 5,
                                            spreadRadius: 1,
                                          ),
                                          BoxShadow(
                                              color: whiteColor,
                                              offset: const Offset(-4, -4),
                                              blurRadius: 10,
                                              spreadRadius: 1),
                                        ]),
                                    child: Icon(
                                      Icons.search,
                                      color: textColor,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  margin:
                                      EdgeInsets.only(left: 5.0.wp(context)),
                                  child: Text(
                                    snapshot.data?.name ?? "",
                                    style: TextStyle(
                                        fontSize: 25.0.sp(context),
                                        fontWeight: FontWeight.w600,
                                        color: textColor),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    myState(() => _isSearch = !_isSearch);
                                    _nameF.requestFocus();
                                  },
                                  child: Container(
                                    margin:
                                        EdgeInsets.only(right: 5.0.wp(context)),
                                    height: 5.0.hp(context),
                                    width: 10.0.wp(context),
                                    decoration: BoxDecoration(
                                        color: mainColor,
                                        shape: BoxShape.circle,
                                        boxShadow: [
                                          BoxShadow(
                                            color: secondaryColor,
                                            offset: const Offset(4, 4),
                                            blurRadius: 5,
                                            spreadRadius: 1,
                                          ),
                                          BoxShadow(
                                              color: whiteColor,
                                              offset: const Offset(-4, -4),
                                              blurRadius: 10,
                                              spreadRadius: 1),
                                        ]),
                                    child: Icon(
                                      Icons.search,
                                      color: textColor,
                                    ),
                                  ),
                                ),
                              ],
                            );
                    }),
                    StatefulBuilder(builder: (context, mainState) {
                      return GestureDetector(
                        onTap: () {
                          mainState(() {
                            if (_heigh == 40.0) {
                              _heigh = 60.0;
                            } else {
                              _heigh = 40.0;
                            }
                          });
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 500),
                          margin: EdgeInsets.only(
                              bottom: 5.0.hp(context),
                              top: 5.0.hp(context),
                              left: 10.0.wp(context),
                              right: 10.0.wp(context)),
                          height: _heigh.hp(context),
                          width: _width.wp(context),
                          decoration: BoxDecoration(
                              color: mainColor,
                              boxShadow: [
                                BoxShadow(
                                    color: secondaryColor,
                                    offset: const Offset(4, 4),
                                    spreadRadius: 1,
                                    blurRadius: 20),
                                const BoxShadow(
                                  color: Colors.white,
                                  offset: Offset(-4, -4),
                                  spreadRadius: 1,
                                  blurRadius: 20,
                                ),
                              ],
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(8))),
                          child: snapshot.hasData
                                  ? Column(
                                      children: [
                                        SizedBox(
                                          height: 2.0.hp(context),
                                        ),
                                        Text(
                                          "${snapshot.data!.tempC}°",
                                          style: TextStyle(
                                              fontSize: 60.0.sp(context),
                                              fontWeight: FontWeight.w500,
                                              color: textColor),
                                        ),
                                        SizedBox(
                                          height: 3.0.hp(context),
                                        ),
                                        snapshot.data!.isday
                                            ? Image(
                                                image: AssetImage(
                                                    WeatherIcon.weatherIcon[
                                                        snapshot.data!.code]))
                                            : Image(
                                                image: AssetImage(WeatherIcon
                                                            .weatherIcon[
                                                        snapshot.data!.code +
                                                            1] ??
                                                    WeatherIcon.weatherIcon[
                                                        snapshot.data!.code])),
                                        SizedBox(
                                          height: 5.0.hp(context),
                                        ),
                                        Text(
                                          snapshot.data!.weatherCondition,
                                          style: TextStyle(
                                              fontSize: 13.0.sp(context),
                                              fontWeight: FontWeight.w500,
                                              color: textColor),
                                        ),
                                        SizedBox(height:  _heigh == 60.0 ?2.0.hp(context) : 0,),
                                        AnimatedContainer(
                                          duration:const Duration(milliseconds: 600),
                                          height: _heigh == 60.0 ? 5.0.hp(context) : 0,
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              Container(margin: EdgeInsets.only(left: 15.0.wp(context)), child: const Image(image: AssetImage('images/humidity.png'))),
                                              Container(
                                                margin: EdgeInsets.only(left: 10.0.wp(context)),
                                                child: Text("${snapshot.data!.humidity}",style: TextStyle(
                                                  fontSize: 15.0.sp(context),
                                                  fontWeight: FontWeight.w500,
                                                  color: textColor) ),
                                              )
                                            ],
                                          ),
                                        ),
                                        AnimatedContainer(
                                          duration:const Duration(milliseconds: 600),
                                          height: _heigh == 60.0 ? 5.0.hp(context) : 0,
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              Container(margin: EdgeInsets.only(left: 15.0.wp(context)), child: const Image(image: AssetImage('images/pressure.png'))),
                                              Container(
                                                margin: EdgeInsets.only(left: 10.0.wp(context)),
                                                child: Text("${snapshot.data!.pressureIn} Ins",style: TextStyle(
                                                  fontSize: 15.0.sp(context),
                                                  fontWeight: FontWeight.w500,
                                                  color: textColor) ),
                                              )
                                            ],
                                          ),
                                        ),
                                        AnimatedContainer(
                                          duration:const Duration(milliseconds: 600),
                                          height: _heigh == 60.0 ? 5.0.hp(context) : 0,
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              Container(margin: EdgeInsets.only(left: 15.0.wp(context)), child: const Image(image: AssetImage('images/windy.png'))),
                                              Container(
                                                margin: EdgeInsets.only(left:10.0.wp(context)),
                                                child: Text("${snapshot.data!.windy} mph",style: TextStyle(
                                                  fontSize: 15.0.sp(context),
                                                  fontWeight: FontWeight.w500,
                                                  color: textColor) ),
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    )
                              : const Center(
                                  child: CircularProgressIndicator()),
                        ),
                      );
                    }),
                    Padding(
                      padding: EdgeInsets.only(left: 4.0.wp(context)),
                      child: Text("Daily Forecast",
                          style: TextStyle(
                              fontSize: 18.0.sp(context),
                              fontWeight: FontWeight.w600,
                              color: textColor)),
                    ),
                    SizedBox(
                      height: 30.0.hp(context),
                      child: FutureBuilder<List<WeatherModal>>(
                        future: apiService.oneDayForcestData(
                            _country == "" ? "yangon" : _country),
                        builder: (context, snapshot) {
                          return snapshot.hasData
                              ? ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: 24,
                                  itemBuilder: (context, index) =>
                                      SevenDaysCard(
                                        modal: snapshot.data![index],
                                      ))
                              : const Center(
                                  child: CircularProgressIndicator(),
                                );
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 4.0.wp(context)),
                      child: Text("Three Days Forecast",
                          style: TextStyle(
                              fontSize: 18.0.sp(context),
                              fontWeight: FontWeight.w600,
                              color: textColor)),
                    ),
                    SizedBox(
                      height: 30.0.hp(context),
                      child: FutureBuilder<List<WeatherModal>>(
                        future: apiService.threeDayForecastData(
                            _country == "" ? "yangon" : _country),
                        builder: (context, snapshot) {
                          return snapshot.hasData
                              ? ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: 3,
                                  itemBuilder: (context, index) =>
                                      ThreeDayForecastCard(
                                        modal: snapshot.data![index],
                                      ))
                              : const Center(
                                  child: CircularProgressIndicator(),
                                );
                        },
                      ),
                    ),
                  ],
                );
              })),
    );
  }
}
