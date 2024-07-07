import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';

import 'weather_states_cubit.dart';



class GetWeatherCubit extends Cubit<WeatherState>{
GetWeatherCubit() : super(NoWeatherState());
WeatherModel? weatherModel;

  getWeather({required String q})async{
    try {
  weatherModel = await WeatherServices(dio: Dio()).GetTheWeather(q: q);
  emit(WeatherLoadedState(weatherModel: weatherModel!));
} catch (e) {
  emit(WeatherFauilerState(message:e.toString()));
}
    
  }

}

