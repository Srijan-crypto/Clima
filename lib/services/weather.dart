import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const apiKey = 'f80eca1537bdc46bc796ccbe1db964b4';

class WeatherModel {
  Future<dynamic> getCityData(String city) async {
    var url = Uri.parse(
      'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey&units=metric',
    );
    NetworkHepler networkHepler = NetworkHepler(url: url);
    var weatherData = await networkHepler.getData();
    return weatherData;
  }

  Future<dynamic> getLocationData() async {
    Location loc = Location();
    await loc.getCurrentLocation();
    var url = Uri.parse(
      'https://api.openweathermap.org/data/2.5/weather?lat=${loc.latitude}&lon=${loc.longitude}&appid=$apiKey&units=metric',
    );
    NetworkHepler networkHepler = NetworkHepler(url: url);
    var weatherData = await networkHepler.getData();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
