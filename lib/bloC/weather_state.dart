part of 'weather_bloc.dart';

@immutable
abstract class WeatherState {}

class WeatherInitial extends WeatherState {}

class NetworkLoading extends WeatherState {}

class NetworkError extends WeatherState {
  final String error_message;

  NetworkError(this.error_message);
}

class NetworkSuccess extends WeatherState {
  final WeatherApi weather;

  NetworkSuccess(this.weather);
}
