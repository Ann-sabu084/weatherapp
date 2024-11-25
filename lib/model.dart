// lib/models/weather.dart

class Weather {
  final String location;
  final String temperature;
  final String condition;
  final String iconUrl;
  final String humidity;
  final String windSpeed;
  final String windDirection;
  final String feelsLikeTemperature;

  Weather({
    required this.location,
    required this.temperature,
    required this.condition,
    required this.iconUrl,
    required this.humidity,
    required this.windSpeed,
    required this.windDirection,
    required this.feelsLikeTemperature,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      location: json['location']['name'],
      temperature: json['current']['temp_c'].toString(),
      condition: json['current']['condition']['text'],
      iconUrl: json['current']['condition']['icon'],
      humidity: json['current']['humidity'].toString(),
      windSpeed: json['current']['wind_kph'].toString(),
      windDirection: json['current']['wind_dir'],
      feelsLikeTemperature: json['current']['feelslike_c'].toString(),
    );
  }
}
