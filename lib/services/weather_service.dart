import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherServices{

 final Dio dio;
 final String BaseUrl='https://api.weatherapi.com/v1';
 final String apiKey='322d260a1c9c403bb19194326241008';
  WeatherServices( {required this.dio});

  
  Future<WeatherModel> GetTheWeather({required String q}) async{

  try {
  Response response=await dio.get('$BaseUrl/forecast.json?key=$apiKey&q=$q&days=7');
  
  WeatherModel weatherModel=WeatherModel.fromjson(response.data);
   return weatherModel;
} 
on DioException catch (e) {
  String ErrMassage=e.response?.data['error']['message'];


    throw Exception(ErrMassage);
}
catch(e){
  log(e.toString());
  throw Exception('oops! there was error please try later');
}
  
   
  
  
 
}  
    

}


