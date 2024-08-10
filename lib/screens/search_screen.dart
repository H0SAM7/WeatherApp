
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/getWeather/get_weather_cubit.dart';

class SearchScreen extends StatelessWidget {
  
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 201, 228, 242),
      appBar: AppBar(title: const Text("Search a city",style: TextStyle(),),),
      body: Center(child: TextField(
        onSubmitted: (value) {
              
        
        var getweathercubit =BlocProvider.of<GetWeatherCubit>(context);
        getweathercubit.getWeather(q: value);
        Navigator.pop(context);
                 
        },
        decoration: const InputDecoration(
          
          hintText: "Search a city",
          labelText:"Search", 
           suffixIcon: Icon(Icons.search),
          border: OutlineInputBorder( borderSide:BorderSide(),borderRadius: BorderRadius.all(Radius.circular(16.0))),
        ),
      )),

    );
  }
}

