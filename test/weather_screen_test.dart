import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_test_laporty/features/weather/cubit/weather_cubit.dart';
import 'package:flutter_test_laporty/features/weather/presentation/screen.dart';

void main() {
  testWidgets('WeatherScreen shows loading and then temperature', (
    tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider(
          create: (_) => WeatherCubit()..fetchWeather(),
          child: const WeatherScreen(),
        ),
      ),
    );

    // تحقق من وجود CircularProgressIndicator أولاً
    expect(find.byType(CircularProgressIndicator), findsOneWidget);

    // إعطاء وقت للCubit لإصدار WeatherLoaded
    await tester.pump(const Duration(seconds: 2));

    expect(find.textContaining('Temperature: '), findsNWidgets(2));
  });
}
