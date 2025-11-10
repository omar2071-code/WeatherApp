import 'package:flutter/material.dart';

MaterialColor getColorWeather(String? condition) {
  if (condition == null) {
    return Colors.blue;
  }
  switch (condition.toLowerCase()) {
    // ☀️ الشمس / الجو المشمس
    case 'sunny':
    case 'clear':
      return Colors.amber;

    // 🌤️ غائم جزئياً
    case 'partly cloudy':
    case 'cloudy':
    case 'overcast':
      return Colors.blueGrey;

    // 🌫️ ضباب / شبورة
    case 'mist':
    case 'fog':
    case 'freezing fog':
      return Colors.grey;

    // 🌧️ المطر
    case 'patchy rain possible':
    case 'light rain':
    case 'moderate rain':
    case 'heavy rain':
    case 'rain shower':
    case 'torrential rain shower':
      return Colors.blue;

    // ❄️ الثلوج
    case 'patchy snow possible':
    case 'light snow':
    case 'moderate snow':
    case 'heavy snow':
    case 'blizzard':
      return Colors.lightBlue;

    // ⚡ الرعد
    case 'thundery outbreaks possible':
    case 'patchy light rain with thunder':
    case 'moderate or heavy rain with thunder':
    case 'moderate or heavy snow with thunder':
      return Colors.deepPurple;

    // الافتراضي
    default:
      return Colors.blue;
  }
}
