import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:meta/meta.dart';

import '../weather/weather_api.dart';

part 'weather_event.dart';

part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherInitial()) {
    on<WeatherEvent>((event, emit) {});
    on<getWeather>((event, emit) async {
      Dio dio = Dio();
      emit(NetworkLoading());
      try {
        var response = await dio.get(
            "http://api.weatherapi.com/v1/forecast.json?key=8c9416d38c45437a8a9105439231109&q=London&days=4");
        Box<WeatherApi> box = await Hive.box("weather");
        final listener = InternetConnection().onStatusChange.listen((InternetStatus status) {
          switch (status) {
            case InternetStatus.connected:
              box.put("offline", WeatherApi.fromJson(response.data));
              emit(NetworkSuccess(WeatherApi.fromJson(response.data)));
              break;
            case InternetStatus.disconnected:
              emit(NetworkSuccess(box.get("offline") as WeatherApi));
              break;
          }
        });
      } on DioException catch (e) {
        emit(NetworkError(e.toString()));
      }
    });
  }
}
