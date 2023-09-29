import 'package:bloc_weather/bloC/weather_bloc.dart';
import 'package:bloc_weather/weather/weather_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:intl/intl.dart';

late Box box;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter<WeatherApi>(WeatherApiAdapter());
  Hive.registerAdapter<Forecast>(ForecastAdapter());
  Hive.registerAdapter<Forecastday>(ForecastdayAdapter());
  Hive.registerAdapter<Hour>(HourAdapter());
  Hive.registerAdapter<Condition>(ConditionAdapter());
  Hive.registerAdapter<Astro>(AstroAdapter());
  Hive.registerAdapter<Day>(DayAdapter());
  Hive.registerAdapter<Current>(CurrentAdapter());
  Hive.registerAdapter<Location>(LocationAdapter());

  box = await Hive.openBox<WeatherApi>("weather");
  runApp(MaterialApp(
      home: BlocProvider(
    create: (context) => WeatherBloc(),
    child: MyApp(),
  )));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String date = DateFormat("dd").format(DateTime.now());
  String today = DateFormat("MMM dd").format(DateTime.now());
  int week_day = DateTime.now().weekday;
  Map<int, String> weekdayName = {
    1: "Mon",
    2: "Tue",
    3: "Wed",
    4: "Thu",
    5: "Fri",
    6: "Sat",
    7: "Sun",
    8: "Mon",
    9: "Tue",
    10: "Wed",
    11: "Thu"
  };

  @override
  void initState() {
    super.initState();
    BlocProvider.of<WeatherBloc>(context).add(getWeather());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: RefreshIndicator(child: BlocBuilder<WeatherBloc, WeatherState>(
      builder: (BuildContext context, WeatherState state) {
        if (state is NetworkLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is NetworkError) {
          return Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.error,
                  size: 50,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(state.error_message),
                SizedBox(
                  height: 20,
                ),
                MaterialButton(
                  onPressed: () {
                    BlocProvider.of<WeatherBloc>(context).add(
                      getWeather(),
                    );
                  },
                  child: Text("Refresh"),
                  color: Colors.green,
                )
              ],
            ),
          );
        } else if (state is NetworkSuccess) {
          return Scaffold(
              body: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                    Colors.blueGrey[300] ?? Colors.transparent,
                    Colors.lightBlueAccent,
                    Colors.lightBlue,
                    Colors.blue
                  ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
                  child: Stack(children: [
                    Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.1,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.05),
                                  Icon(
                                    Icons.location_on_sharp,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.02),
                                  Text(
                                    "${state.weather.location?.name}",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 17),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.menu,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.05)
                                ],
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 0.45,
                            child: Column(
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      today,
                                      style: TextStyle(
                                        fontSize: 35,
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.02),
                                    Text(
                                      "Updated ${state.weather.current?.lastUpdated}",
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.06),
                                Column(
                                  children: [
                                    Image.network(
                                      "${state.weather.current?.condition?.icon}",
                                    ),
                                    Text(
                                      "${state.weather.current?.condition?.text}",
                                      style: TextStyle(
                                        fontSize: 30,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "${state.weather.current?.tempC}",
                                          style: TextStyle(
                                            fontSize: 45,
                                            color: Colors.white,
                                          ),
                                        ),
                                        Text(
                                          "°C",
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.white,
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.15,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                children: [
                                  Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.08,
                                      child:
                                          Image.asset("assets/humidity.png")),
                                  Text(
                                    "HUMIDITY",
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    "${state.weather.current?.humidity} %",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.08,
                                      child: Image.asset("assets/wind.png")),
                                  Text(
                                    "Wind",
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    "${state.weather.current?.windKph} km/h",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.08,
                                      child:
                                          Image.asset("assets/FeelsLike.png")),
                                  Text(
                                    "FEELS LIKE",
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    "${state.weather.current?.feelslikeC} °C",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: Container(
                              width: MediaQuery.of(context).size.width * 0.8,
                              height: MediaQuery.of(context).size.height * 0.2,
                              decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.6),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    width:
                                    MediaQuery.of(context).size.width * 0.2,
                                    child: Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                      children: [
                                        Text(
                                          "${weekdayName[week_day + 1]}",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15),
                                        ),
                                        Column(
                                          children: [
                                            Container(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                    0.1,
                                                child: Image.asset(
                                                    "assets/wind.webp")),
                                            Text(
                                                "${state.weather.forecast?.forecastday?[0].day?.avgtempC} °C",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 15))
                                          ],
                                        ),
                                        Text(
                                            "${state.weather.forecast?.forecastday?[0].day?.maxwindKph}\n"
                                                "km/h",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15))
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width:
                                    MediaQuery.of(context).size.width * 0.2,
                                    child: Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                      children: [
                                        Text(
                                          "${weekdayName[week_day + 2]}",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15),
                                        ),
                                        Column(
                                          children: [
                                            Container(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                    0.1,
                                                child: Image.asset(
                                                    "assets/wind.webp")),
                                            Text(
                                                "${state.weather.forecast?.forecastday?[1].day?.avgtempC} °C",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 15))
                                          ],
                                        ),
                                        Text(
                                            "${state.weather.forecast?.forecastday?[1].day?.maxwindKph}\n"
                                                "km/h",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15))
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width:
                                    MediaQuery.of(context).size.width * 0.2,
                                    child: Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                      children: [
                                        Text(
                                          "${weekdayName[week_day + 3]}",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15),
                                        ),
                                        Column(
                                          children: [
                                            Container(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                    0.1,
                                                child: Image.asset(
                                                    "assets/wind.webp")),
                                            Text(
                                                "${state.weather.forecast?.forecastday?[2].day?.avgtempC} °C",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 15))
                                          ],
                                        ),
                                        Text(
                                            "${state.weather.forecast?.forecastday?[2].day?.maxwindKph}\n"
                                                "km/h",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15))
                                      ],
                                    ),
                                  ),

                                ],
                              )
                        )
                        )],
                    ),
                  ])));
        } else {
          return Container(
            color: Colors.pink,
          );
        }
      },
    ), onRefresh: () async {
      BlocProvider.of<WeatherBloc>(context).add(getWeather());
    }));
  }
}
