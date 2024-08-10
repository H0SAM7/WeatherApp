import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/getWeather/get_weather_cubit.dart';
import 'package:weather_app/cubit/getWeather/weather_states_cubit.dart';
import 'package:weather_app/screens/noWeather.dart';
import 'package:weather_app/screens/search_screen.dart';
import 'package:weather_app/screens/weather.dart';
import 'package:weather_app/widget/menu_bar.dart';

class Home extends StatelessWidget {
   const Home({super.key});
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:const Color.fromARGB(255, 201, 228, 242) ,
      drawer: menuBar(),
      appBar: AppBar(
        centerTitle: true,
        title: const Padding(
          padding: EdgeInsets.only(left: 15.0),
          child: Center(child: Text('Weather App',)),
        ),
        
        // iconTheme: const IconThemeData(color: Colors.white),
        // actionsIconTheme: const IconThemeData(color: Colors.white),
        actions: [
          
          
          IconButton(
            
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SearchScreen()));
              },
              icon: const Icon(Icons.search)),
              IconButton(
              
                onPressed: (){
                ThemeData.dark();
        }, icon: const Icon(Icons.dark_mode))
        ],
      ),
      body:
       BlocBuilder<GetWeatherCubit, WeatherState>(
        builder: (context, state) {
          if (state is NoWeatherState){
            return const NoWeather();
          }
          else if(state is WeatherLoadedState){
            return Weather(weatherModel: state.weatherModel,);
          }
          else{
            return const Center(child: Text("OOPS! there was error, please Try again",style: TextStyle(fontSize: 30),));
          }
        },
      ),
      
    );
  }
}
