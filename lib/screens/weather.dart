import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/getWeather/get_weather_cubit.dart';
import 'package:weather_app/main.dart';
import 'package:weather_app/models/forecast_days_model.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/widget/forcaste_list_view.dart';

class Weather extends StatelessWidget {
  const Weather({super.key, required this.weatherModel});
  final WeatherModel weatherModel;

  @override
  Widget build(BuildContext context) {
    WeatherModel? weatherModel =
        BlocProvider.of<GetWeatherCubit>(context).weatherModel;
    // final List<Forecast> ls = [
    //   Forecast(
    //       day: getDayOfWeek(weatherModel?.day2),
    //       maxtmp: '${weatherModel?.mintmp2.round()}',
    //       mintmp: '${weatherModel?.maxtmp.round()}' '° C'),
    //   Forecast(
    //       day: getDayOfWeek(weatherModel?.day3),
    //       maxtmp: '${weatherModel?.mintmp3.round()}',
    //       mintmp: '${weatherModel?.maxtmp.round()}' '° C'),
    //   Forecast(
    //       day: getDayOfWeek(weatherModel?.day4),
    //       maxtmp: '${weatherModel?.mintmp4.round()}',
    //       mintmp: '${weatherModel?.maxtmp.round()}' '° C'),
    //   Forecast(
    //       day: getDayOfWeek(weatherModel?.day5),
    //       maxtmp: '${weatherModel?.mintmp5.round()}',
    //       mintmp: '${weatherModel?.maxtmp.round()}' '° C'),
    //   Forecast(
    //       day: getDayOfWeek(weatherModel?.day6),
    //       maxtmp: '${weatherModel?.mintmp6.round()}',
    //       mintmp: '${weatherModel?.maxtmp.round()}' '° C'),
    //   Forecast(
    //       day: getDayOfWeek(weatherModel?.day7),
    //       maxtmp: '${weatherModel?.mintmp7.round()}',
    //       mintmp: '${weatherModel?.maxtmp.round()}' '° C'),
    // ];

    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            getColor(weatherModel!.WeatherCondition),
            getColor(weatherModel.WeatherCondition)[900]!,
            getColor(weatherModel.WeatherCondition)[800]!,
            getColor(weatherModel.WeatherCondition)[700]!,
            getColor(weatherModel.WeatherCondition)[500]!,
            getColor(weatherModel.WeatherCondition)[600]!,
            getColor(weatherModel.WeatherCondition)[300]!,
            getColor(weatherModel.WeatherCondition)[100]!,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 80,
                    width: 250,
                    child: Center(
                      child: Text(
                        weatherModel.cityName,
                        style: const TextStyle(
                            fontSize: 35,
                            fontFamily: AutofillHints.addressCity,
                            color: Colors.white),
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      'Updated at ${weatherModel.date.hour}:${weatherModel.date.minute}',
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    height: 140,
                    width: 300,
                    child: Center(
                      child: Text(
                        '${weatherModel.temp.round()}° C',
                        style:
                            const TextStyle(fontSize: 45, color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 80,
                    width: 600,
                    child: Divider(
                      indent: 40,
                      endIndent: 40,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: 130,
                    width: 400,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.network('https:${weatherModel.image}'),
                        Center(
                          child: Text(
                            weatherModel.WeatherCondition,
                            style: const TextStyle(
                                fontSize: 27, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
          // SliverList(
          //   delegate: SliverChildBuilderDelegate(
          //     (context, index) {
          //       return forcastListView(forecast: ls[index]);
          //     },
          //     childCount: ls.length,
          //   ),
          // ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 60,
            ),
          ),
          const SliverToBoxAdapter(
            child: Divider(
              indent: 40,
              endIndent: 40,
              color: Colors.black,
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 80,
            ),
          ),
          SliverToBoxAdapter(
            child: ListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                SizedBox(
                  height: 80,
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 90,
                        width: 180,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          gradient: LinearGradient(
                            colors: [
                              getColor(weatherModel.WeatherCondition)[900]!,
                              getColor(weatherModel.WeatherCondition)[800]!,
                              getColor(weatherModel.WeatherCondition)[700]!,
                              getColor(weatherModel.WeatherCondition)[500]!,
                              getColor(weatherModel.WeatherCondition)[600]!,
                              getColor(weatherModel.WeatherCondition)[300]!,
                              getColor(weatherModel.WeatherCondition)[600]!,
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Icon(Icons.sunny, color: Colors.amber),
                            const Text('UV',
                                style: TextStyle(color: Colors.white)),
                            Text('%',
                                style: const TextStyle(color: Colors.white)),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 100,
                        width: 200,
                        child: Container(
                          height: 90,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            gradient: LinearGradient(
                              colors: [
                                getColor(weatherModel.WeatherCondition)[900]!,
                                getColor(weatherModel.WeatherCondition)[800]!,
                                getColor(weatherModel.WeatherCondition)[700]!,
                                getColor(weatherModel.WeatherCondition)[500]!,
                                getColor(weatherModel.WeatherCondition)[600]!,
                                getColor(weatherModel.WeatherCondition)[300]!,
                                getColor(weatherModel.WeatherCondition)[600]!,
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const Icon(Icons.sunny_snowing,
                                  color: Colors.blue),
                              const Text('Humidity',
                                  style: TextStyle(color: Colors.white)),
                              Text('%',
                                  style: const TextStyle(color: Colors.white)),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Divider(
                  indent: 20,
                  endIndent: 20,
                  color: Colors.black,
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 100,
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 90,
                        width: 180,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          gradient: LinearGradient(
                            colors: [
                              getColor(weatherModel.WeatherCondition)[900]!,
                              getColor(weatherModel.WeatherCondition)[800]!,
                              getColor(weatherModel.WeatherCondition)[700]!,
                              getColor(weatherModel.WeatherCondition)[500]!,
                              getColor(weatherModel.WeatherCondition)[600]!,
                              getColor(weatherModel.WeatherCondition)[300]!,
                              getColor(weatherModel.WeatherCondition)[600]!,
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Icon(Icons.wind_power_sharp,
                                color: Colors.grey),
                            const Text('Wind',
                                style: TextStyle(color: Colors.white)),
                            Text('%',
                                style: const TextStyle(color: Colors.white)),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 90,
                        width: 200,
                        child: Container(
                          height: 90,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            gradient: LinearGradient(
                              colors: [
                                getColor(weatherModel.WeatherCondition)[900]!,
                                getColor(weatherModel.WeatherCondition)[800]!,
                                getColor(weatherModel.WeatherCondition)[700]!,
                                getColor(weatherModel.WeatherCondition)[500]!,
                                getColor(weatherModel.WeatherCondition)[600]!,
                                getColor(weatherModel.WeatherCondition)[300]!,
                                getColor(weatherModel.WeatherCondition)[600]!,
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  const Icon(Icons.sunny, color: Colors.amber),
                                  const Text('Sunrise',
                                      style: TextStyle(color: Colors.white)),
                                  Text('weatherModel.sunrise,',
                                      style:
                                          const TextStyle(color: Colors.white)),
                                ],
                              ),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  const Icon(Icons.sunny,
                                      color: Color.fromARGB(255, 177, 70, 62)),
                                  const Text('Sunset',
                                      style: TextStyle(color: Colors.white)),
                                  Text('weatherModel.sunset',
                                      style:
                                          const TextStyle(color: Colors.white)),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String getDayOfWeek(DateTime? date) {
    if (date == null) return 'Today';
    int dayOfWeek = date.weekday;
    List<String> weekdays = [
      "Monday",
      "Tuesday",
      "Wednesday",
      "Thursday",
      "Friday",
      "Saturday",
      "Sunday"
    ];
    return weekdays[dayOfWeek - 1];
  }
}
