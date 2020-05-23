import 'package:weatherapp/services/location.dart';
import 'package:weatherapp/services/networking.dart';

const apiKey = '499c48a08495171ef416cd1e4cc98df5';
const openWeatherBaseURL = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {

  Future<dynamic> getCityWeather(String cityName) async {

    Location location = Location();
    await location.geCurrentLocation();

    NetworkHelper networkHelper = NetworkHelper('$openWeatherBaseURL?q=$cityName&appid=$apiKey&units=metric');

    var weatherData = await networkHelper.getData();
    print(weatherData);
    return weatherData;

  }

  Future<dynamic> getLocationWeather() async  {

    Location location = Location();
    await location.geCurrentLocation();

    NetworkHelper networkHelper = NetworkHelper('$openWeatherBaseURL?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');

    var weatherData = await networkHelper.getData();
    print(weatherData);
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
