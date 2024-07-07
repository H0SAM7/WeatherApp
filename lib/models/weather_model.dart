class WeatherModel {
  final String cityName;
  final DateTime date;
  final String? image;
  final double temp;
  final double mintmp;
  final double maxtmp;
  final String WeatherCondition;
  final DateTime day2;
  final DateTime day3;
  final DateTime day4;
  final DateTime day5;
  final DateTime day6;
  final DateTime day7;
  final double mintmp2;
  final double maxtmp2;
  final double mintmp3;
  final double maxtmp3;
  final double mintmp4;
  final double maxtmp4;
  final double mintmp5;
  final double maxtmp5;
  final double mintmp6;
  final double maxtmp6;
  final double mintmp7;
  final double maxtmp7;
  // final String? image2;
  // final String? image3;
  // final String? image4;
  // final String? image5;
  // final String? image6;
  // final String? image7;

  final double uv;
  final int humidity;
  final double wind;
  final String sunrise;
  final String sunset;
  WeatherModel({
    required this.cityName,
    required this.date,
    required this.image,
    required this.temp,
    required this.mintmp,
    required this.maxtmp,
    required this.WeatherCondition,
    required this.day2,
    required this.day3,
    required this.day4,
    required this.day5,
    required this.day6,
    required this.day7,
    required this.mintmp2,
    required this.maxtmp2,
    required this.mintmp3,
    required this.maxtmp3,
    required this.mintmp4,
    required this.maxtmp4,
    required this.mintmp5,
    required this.maxtmp5,
    required this.mintmp6,
    required this.maxtmp6,
    required this.mintmp7,
    required this.maxtmp7,
    required this.humidity,
    required this.wind,
    required this.sunrise,
    required this.sunset,
    required this.uv,

    // required this.image2,
    // required this.image3,
    // required this.image4,
    // required this.image5,
    // required this.image6,
    // required this.image7,


  });

  factory WeatherModel.fromjson(Map<String, dynamic> json) {
    return WeatherModel(
      cityName: json['location']['name'],
      date: DateTime.parse(json['current']['last_updated']),
      image: json['current']['condition']['icon'],
      temp: json['forecast']['forecastday'][0]['day']['avgtemp_c'],
      mintmp: json['forecast']['forecastday'][0]['day']['mintemp_c'],
      maxtmp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
      WeatherCondition: json['current']['condition']['text'],
      day2: DateTime.parse(json['forecast']['forecastday'][1]['date'],),
      day3: DateTime.parse(json['forecast']['forecastday'][2]['date'],),
      day4: DateTime.parse(json['forecast']['forecastday'][3]['date'],),
      day5: DateTime.parse(json['forecast']['forecastday'][4]['date'],),
      day6: DateTime.parse(json['forecast']['forecastday'][5]['date'],),
      day7: DateTime.parse(json['forecast']['forecastday'][6]['date'],),
      mintmp2: json['forecast']['forecastday'][1]['day']['mintemp_c'],
      maxtmp2: json['forecast']['forecastday'][1]['day']['maxtemp_c'],
      mintmp3: json['forecast']['forecastday'][2]['day']['mintemp_c'],
      maxtmp3: json['forecast']['forecastday'][2]['day']['maxtemp_c'],
      mintmp4: json['forecast']['forecastday'][3]['day']['mintemp_c'],
      maxtmp4: json['forecast']['forecastday'][3]['day']['maxtemp_c'],
      mintmp5: json['forecast']['forecastday'][4]['day']['mintemp_c'],
      maxtmp5: json['forecast']['forecastday'][4]['day']['maxtemp_c'],
      mintmp6: json['forecast']['forecastday'][5]['day']['mintemp_c'],
      maxtmp6: json['forecast']['forecastday'][5]['day']['maxtemp_c'],
      mintmp7: json['forecast']['forecastday'][6]['day']['mintemp_c'],
      maxtmp7: json['forecast']['forecastday'][6]['day']['maxtemp_c'],
      uv: json['forecast']['forecastday'][0]['hour'][0]['uv'],
      sunrise: json['forecast']['forecastday'][0]['astro']['sunrise'],
      sunset: json['forecast']['forecastday'][0]['astro']['sunset'],
      humidity: json['forecast']['forecastday'][0]['hour'][0]['humidity'],
      wind: json['forecast']['forecastday'][0]['day']['maxwind_kph'],

      // image2: json['forecast']['forecastday'][1]['day']['condition']['icon'],
      // image3: json['forecast']['forecastday'][2]['day']['condition']['icon'],
      // image4: json['forecast']['forecastday'][3]['day']['condition']['icon'],
      // image5: json['forecast']['forecastday'][4]['day']['condition']['icon'],
      // image6: json['forecast']['forecastday'][5]['day']['condition']['icon'],
      // image7: json['forecast']['forecastday'][6]['day']['condition']['icon'],
    );
  }



  
}