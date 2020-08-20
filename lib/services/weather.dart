import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const apiKey = '33798295956518216f05b3bfdff56d94';
const openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getLocationWeather() async {
    Location location = new Location();
    await location.getCurrentLocation();
    double lat = location.myLat;
    double long = location.myLong;

    NetworkHelper networkHelper = NetworkHelper(
        '$openWeatherMapURL?lat=$lat&lon=$long&appid=$apiKey&units=imperial');

    var weatherData = await networkHelper.getData();

    return weatherData;
  }

  Future<dynamic> getCityWeather(String cityName) async {
    var url = '$openWeatherMapURL?q=$cityName&appid=$apiKey&units=imperial';

    NetworkHelper helper = NetworkHelper(url);

    var weatherData = await helper.getData();

    return weatherData;
  }

  Color getIconColor(int condition) {
    if (condition < 300) {
      return Colors.white;
    } else if (condition < 400) {
      return Colors.lightBlue[100];
    } else if (condition < 600) {
      return Colors.lightBlue[200];
    } else if (condition < 700) {
      return Colors.white;
    } else if (condition == 711) {
      return Colors.white;
    } else if (condition < 800) {
      return Colors.red;
    } else if (condition == 800) {
      return Colors.yellow;
    } else if (condition <= 804) {
      return Colors.white;
    }
    return null;
  }

  IconData getIconName(int condition) {
    if (condition < 300) {
      return WeatherIcons.wi_thunderstorm;
    } else if (condition < 400) {
      return WeatherIcons.wi_showers;
    } else if (condition < 600) {
      return WeatherIcons.wi_rain;
    } else if (condition < 700) {
      return WeatherIcons.wi_snow;
    } else if (condition == 711) {
      return WeatherIcons.wi_smoke;
    } else if (condition < 800) {
      return WeatherIcons.wi_storm_warning;
    } else if (condition == 800) {
      return WeatherIcons.wi_day_sunny;
    } else if (condition <= 804) {
      return WeatherIcons.wi_cloudy;
    }
    return null;
  }
}
