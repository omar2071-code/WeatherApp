import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get%20weather%20cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get%20weather%20cubit/get_weather_states.dart';
import 'package:weather_app/views/home_view.dart';

void main() {
  //Bloc.observer = MyBlocObserver();
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(
        builder: (context) {
          return BlocBuilder<GetWeatherCubit, WeatherStates>(
            builder: (context, state) {
              return MaterialApp(
                theme: ThemeData(
                  useMaterial3: false,
                  primarySwatch: getColorWeather(
                    BlocProvider.of<GetWeatherCubit>(
                      context,
                    ).weatherModel?.weatherCondition,
                  ),
                ),
                debugShowCheckedModeBanner: false,
                home: HomeView(),
              );
            },
          );
        },
      ),
    );
  }
}

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
