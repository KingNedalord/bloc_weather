part of 'weather_bloc.dart';

@immutable
abstract class WeatherEvent {}
class getWeather extends WeatherEvent{
   String? city;

  getWeather(this.city);
}