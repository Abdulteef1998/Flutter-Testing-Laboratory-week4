import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_test_laporty/features/weather/cubit/weather_cubit.dart';
import 'package:flutter_test_laporty/features/weather/cubit/weather_state.dart';

void main() {
  group('WeatherCubit', () {
    late WeatherCubit cubit;

    setUp(() => cubit = WeatherCubit());

    test('initial state is WeatherInitial', () {
      expect(cubit.state, isA<WeatherInitial>());
    });

    test('fetchWeather emits WeatherLoading then WeatherLoaded', () async {
      final expectedStates = [isA<WeatherLoading>(), isA<WeatherLoaded>()];

      expectLater(cubit.stream, emitsInOrder(expectedStates));

      await cubit.fetchWeather();
    });
  });
}
