class Weather {
  final double tempCelsius;

  Weather({required this.tempCelsius});

  double get tempFahrenheit => tempCelsius * 9 / 5 + 32;

  factory Weather.fromJson(Map<String, dynamic> json) {
    final temp = json['temp'] as num?;
    if (temp == null) throw Exception('Temperature is missing');
    return Weather(tempCelsius: temp.toDouble());
  }
}
