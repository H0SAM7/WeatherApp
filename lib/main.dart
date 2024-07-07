import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/getWeather/get_weather_cubit.dart';
import 'package:weather_app/cubit/getWeather/weather_states_cubit.dart';
import 'package:weather_app/screens/home.dart';

void main() {

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(
        builder: (context) => BlocBuilder<GetWeatherCubit, WeatherState>(
          builder: (context, state) {
            
            return MaterialApp(
              
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                
                useMaterial3: false,
                primarySwatch: getColor(

                    BlocProvider.of<GetWeatherCubit>(context)
                        .weatherModel
                        ?.WeatherCondition),
              ),
              home: home(),
              
              
            
            );
          },
        ),
      ),
    );
  }

  
}

MaterialColor getColor(String? condition) {
  switch (condition) {
    case 'Sunny':
      return Colors.amber;

    case 'Partly cloudy':
    case 'Cloudy':
    case 'Overcast':
      return Colors.blue;

    case 'Mist':
    case 'Fog':
    case 'Freezing fog':
      return Colors.grey;

    case 'Patchy rain possible':
    case 'Patchy snow possible':
    case 'Patchy sleet possible':
    case 'Patchy freezing drizzle possible':
    case 'Patchy light drizzle':
    case 'Light drizzle':
    case 'Freezing drizzle':
    case 'Heavy freezing drizzle':
    case 'Patchy light rain':
    case 'Light rain':
    case 'Moderate rain at times':
    case 'Moderate rain':
    case 'Heavy rain at times':
    case 'Heavy rain':
    case 'Light freezing rain':
    case 'Moderate or heavy freezing rain':
    case 'Light sleet':
    case 'Moderate or heavy sleet':
    case 'Patchy light snow':
    case 'Light snow':
    case 'Patchy moderate snow':
    case 'Moderate snow':
    case 'Patchy heavy snow':
    case 'Heavy snow':
    case 'Light rain shower':
    case 'Moderate or heavy rain shower':
    case 'Torrential rain shower':
    case 'Light sleet showers':
    case 'Moderate or heavy sleet showers':
    case 'Light snow showers':
    case 'Moderate or heavy snow showers':
    case 'Patchy light rain with thunder':
    case 'Moderate or heavy rain with thunder':
    case 'Patchy light snow with thunder':
    case 'Moderate or heavy snow with thunder':
      return Colors.lightBlue;

    case 'Thundery outbreaks possible':
    case 'Blowing snow':
    case 'Blizzard':
    case 'Ice pellets':
    case 'Light showers of ice pellets':
    case 'Moderate or heavy showers of ice pellets':
      return Colors.indigo;

    default:
      return Colors.blue;
  }
}

  