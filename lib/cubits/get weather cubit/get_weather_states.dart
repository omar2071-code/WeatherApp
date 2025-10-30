import 'package:weather_app/models/weather_model.dart';

class WeatherStates {}

class GetNoWeatherStates extends WeatherStates {}

class GetWeatherSucessStates extends WeatherStates {
  final WeatherModel weatherModel;

  GetWeatherSucessStates(this.weatherModel);
}

class GetWeatherFailureStates extends WeatherStates {
  final String messageError;

  GetWeatherFailureStates(this.messageError);
}
