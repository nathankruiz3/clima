import 'package:clima/screens/city_screen.dart';
import 'package:clima/services/weather.dart';
import 'package:clima/util/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:clima/widgets/temp_card.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:clima/widgets/caption_icon.dart';

class LocationScreen extends StatefulWidget {
  LocationScreen({this.locationWeather});

  final locationWeather;
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  int temp;
  int condition;
  int lowTemp;
  int highTemp;
  String cityName;
  String capDesc;
  IconData iconName;
  Color iconColor;

  WeatherModel model = WeatherModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    updateUI(widget.locationWeather);
  }

  void updateUI(dynamic weatherData) {
    setState(() {
      if (weatherData == null) {
        temp = 0;
        cityName = 'ERROR';
        iconName = MaterialIcons.error;
        capDesc = 'Unable to get weather data.';
        lowTemp = 0;
        highTemp = 0;
        return;
      }
      cityName = weatherData['name'];
      double temper = weatherData['main']['temp'];
      temp = temper.toInt();
      condition = weatherData['weather'][0]['id'];
      dynamic low = weatherData['main']['temp_min'];
      lowTemp = low.toInt();
      dynamic high = weatherData['main']['temp_max'];
      highTemp = high.toInt();
      String desc = weatherData['weather'][0]['description'];
      capDesc = desc.inCaps;
      print(condition);
      iconColor = model.getIconColor(condition);
      iconName = model.getIconName(condition);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColorDarker,
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                'https://images.unsplash.com/photo-1513002749550-c59d786b8e6c?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max',
              ),
              fit: BoxFit.cover,
            ),
          ),
          padding: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 35,
                width: double.infinity,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Row(
                  children: <Widget>[
                    RawMaterialButton(
                      onPressed: () async {
                        var weatherData = await model.getLocationWeather();
                        updateUI(weatherData);
                      },
                      child: Icon(
                        MaterialIcons.near_me,
                        size: 40,
                        color: Color(0xCCFFFFFF),
                      ),
                    ),
                    Text(
                      'Climate Genie',
                      style: kAppBarText,
                    ),
                    RawMaterialButton(
                      onPressed: () async {
                        var typedName = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return CityScreen();
                            },
                          ),
                        );
                        if (typedName != null) {
                          var weatherData =
                              await model.getCityWeather(typedName);
                          print(weatherData);
                          updateUI(weatherData);
                        }
                      },
                      child: Icon(
                        MaterialIcons.add_location,
                        size: 40,
                        color: Color(0xCCFFFFFF),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: kPrimaryColorDarker,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Text(
                          '$cityName',
                          style: kTempText,
                        ),
                        CaptionIcon(
                            iconName: iconName,
                            iconColor: iconColor,
                            capDesc: capDesc),
                        Text(
                          '$temp°F',
                          style: kTempNum,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            TempCard(
                              temp: lowTemp,
                              tempLabel: 'Low',
                            ),
                            TempCard(
                              temp: highTemp,
                              tempLabel: 'High',
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  width: 325,
                  height: 650,
                ),
              ),
              SizedBox(
                height: 45,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

extension CapExtension on String {
  String get inCaps => '${this[0].toUpperCase()}${this.substring(1)}';
  String get allInCaps => this.toUpperCase();
}
