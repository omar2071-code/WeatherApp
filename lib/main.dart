import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get%20weather%20cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get%20weather%20cubit/get_weather_states.dart';
import 'package:weather_app/services/weather_services.dart';
import 'package:weather_app/views/home_view.dart';
import 'package:weather_app/widgets/get_color_weather.dart';

void main() {
  //Bloc.observer = MyBlocObserver();
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(WeatherServices(Dio())),
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
