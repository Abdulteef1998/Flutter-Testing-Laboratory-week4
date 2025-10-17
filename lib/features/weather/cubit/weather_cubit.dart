import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/models/weather_model.dart';
import 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(WeatherInitial());

  Future<void> fetchWeather() async {
    emit(WeatherLoading());
    try {
      // محاكاة جلب بيانات API
      await Future.delayed(const Duration(seconds: 1));
      // مثال بيانات صحيحة
      final weather = Weather(tempCelsius: 25);
      emit(WeatherLoaded(weather));
    } catch (e) {
      emit(WeatherError('Failed to fetch weather'));
    }
  }
}
