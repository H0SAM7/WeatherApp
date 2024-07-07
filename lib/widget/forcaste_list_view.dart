import 'package:flutter/material.dart';

import 'package:weather_app/models/forecast_days_model.dart';

class forcastListView extends StatelessWidget {
  final Forecast forecast;
 const forcastListView({super.key,required this.forecast});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10,left: 10,top: 3),
      child: Container(
        decoration: BoxDecoration( border: Border(bottom: BorderSide(color: Theme.of(context).dividerColor))),


        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,children: [
          
          SizedBox(
            height: 20,
            width: 80,
            child: Text('${forecast.day}' ,style: TextStyle( fontFamily: AutofillHints.addressCity, color: Colors.white),)),
          
          SizedBox(
            height: 20,
            width: 10,
            child: icon(forecast.maxtmp)),
      
          SizedBox(
            height: 20,
            width: 40,
            child: Text(forecast.mintmp,style: TextStyle( fontFamily: AutofillHints.addressCity, color: Colors.white),)),

          SizedBox(
            height: 20,
            width: 50,
            child: Text(forecast.maxtmp,style: TextStyle( fontFamily: AutofillHints.addressCity, color: Colors.white),)),
        
        ],),
      ),
    );
  }

 Icon icon(String? degree){
  if(degree == null) return const Icon(Icons.wb_sunny_rounded);
    if (int.parse(degree) <=20.0){
    return Icon(Icons.snowing,color: Colors.blue,);
    }
    else if(int.parse (degree) >20.0 &&int.parse (degree) <30.0){
      return Icon(Icons.cloud,color: Colors.lightBlue);
    
}
else{
  return Icon(Icons.sunny,color: Colors.amber);
}

 }
}