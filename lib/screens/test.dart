import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:weather_app/cubit/getWeather/get_weather_cubit.dart';
import 'package:weather_app/main.dart';
import 'package:weather_app/models/weather_model.dart';




class Weather extends StatelessWidget {

const Weather({super.key,required this.weatherModel});
final WeatherModel weatherModel;
  @override
  Widget build(BuildContext context) {
  WeatherModel? weatherModel =BlocProvider.of<GetWeatherCubit>(context).weatherModel;
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            getColor(weatherModel!.WeatherCondition),
            getColor(weatherModel.WeatherCondition)[900]!,
            getColor(weatherModel.WeatherCondition)[400]!,
            getColor(weatherModel.WeatherCondition)[300]!,
      
            getColor(weatherModel.WeatherCondition)[500]!,
            ],
          begin:Alignment.topCenter,
    
          end: Alignment.bottomCenter )
      ),
      child: Padding(
        padding: const EdgeInsets.only(top:  200.0),
        child: Column(
         
         mainAxisSize: MainAxisSize.min,
          children: [
           Center(child: Text(weatherModel.cityName,style: TextStyle(fontSize: 30))),
            Center(child: Text('Updated at ${weatherModel.date.hour}:${weatherModel.date.minute}')),
        
          Row(children: [
            Image.network('https:${weatherModel.image}') ,
            const SizedBox(width: 100,),
            Text('${weatherModel.temp.round()}',style: TextStyle(fontSize: 25)),
            const SizedBox(width: 100,),
            Column(children: [
              Text('max temp: ${weatherModel.mintmp.round()}',style: TextStyle(fontSize: 14)),
              SizedBox(height: 3,),
              Text('min temp: ${weatherModel.maxtmp.round()}',style: TextStyle(fontSize: 14))
            ],)
      
          ],),
        
        
          Center(child: Text(weatherModel.WeatherCondition,style: TextStyle(fontSize: 27),),)],
        ),
      ),
    );
  }
}

Future<void> onRefresh()async{
  
  return await Future.delayed(Duration(seconds: 2), () {
    
   
});
}