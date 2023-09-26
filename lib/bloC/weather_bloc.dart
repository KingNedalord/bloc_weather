import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
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
        if (response.statusCode == 200) {
          emit(NetworkSuccess(WeatherApi.fromJson(response.data)));
        } else {
          emit(NetworkError("Undefined error"));
        }
      } on DioException catch (e) {
        emit(NetworkError(e.toString()));

      }
    });
  }
}
