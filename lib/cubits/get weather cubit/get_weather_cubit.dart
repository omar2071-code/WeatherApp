import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get%20weather%20cubit/get_weather_states.dart';
import 'package:weather_app/services/weather_services.dart';

import '../../models/weather_model.dart';

class GetWeatherCubit extends Cubit<WeatherStates> {
  GetWeatherCubit() : super(GetNoWeatherStates());
  WeatherModel? weatherModel;
  getWeather({required String cityName}) async {
    try {
      weatherModel = await WeatherServices(
        Dio(),
      ).getCurrentWeather(cityName: cityName);
      if (weatherModel != null) {
        emit(GetWeatherSucessStates(weatherModel!));
      } else {
        emit(GetWeatherFailureStates('oops find some error'));
      }
    } on Exception catch (e) {
      emit(GetWeatherFailureStates(e.toString()));
    }
  }
}
