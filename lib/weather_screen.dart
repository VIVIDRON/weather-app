import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:weather_app/private.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final String cityName = 'Nashik';
  Future<Map<String, dynamic>> getCurrentWeather() async {
    try {
      final res = await http.get(Uri.parse(
          'https://api.openweathermap.org/data/2.5/forecast?q=$cityName,IN&APPID=$weatherForeCastAPIKey'));
      final data = jsonDecode(res.body);
      if (data['cod'] != '200') throw 'An unexpected error occured';
      return data;
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Weather App',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            )),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {});
            },
            icon: Icon(Icons.refresh),
          ),
        ],
      ),
      body: FutureBuilder(
          future: getCurrentWeather(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            }
            if (snapshot.hasError) {
              return Center(child: Text(snapshot.error.toString()));
            }
            final data = snapshot.data!;
            final currentData = data['list'][0];
            final double currentTemp = currentData['main']['temp'];
            final currentSky = currentData['weather'][0]['main'];
            final pressure = currentData['main']['pressure'];
            final windSpeed = currentData['wind']['speed'];
            final humidity = currentData['main']['humidity'];

            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 25,
                  children: [
                    Text(
                      'City : $cityName',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Card(
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                children: [
                                  Text(
                                    '${(currentTemp - 273.15).toStringAsFixed(2)}°C',
                                    style: TextStyle(
                                      fontSize: 32,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Icon(
                                    currentSky == 'Clouds' ||
                                            currentSky == 'Rain'
                                        ? Icons.cloud
                                        : Icons.sunny,
                                    size: 64,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    currentSky,
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Text(
                      'Weather Forecast',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    // SingleChildScrollView(   not a good practice as we are creating each widget, we should  only create the widget is visible on screen
                    //   scrollDirection: Axis.horizontal,
                    //   child: Row(
                    //     children: [
                    //       for(int i=0 ; i<5; i++)
                    //       ForeCastCard(
                    //         icon: data['list'][i+1]['weather'][0]['main']=='Clouds' || data['list'][i+1]['weather'][0]['main']=='Rain' ? Icons.cloud : Icons.sunny,
                    //         time: data['list'][i+1]['dt'].toString(),
                    //         value: data['list'][i+1]['main']['temp'].toString()),
                    //     ],
                    //   ),
                    // ),

                    SizedBox(
                      height: 125,
                      child: ListView.builder(
                          itemCount: 5,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            final hourlyForeCast = data['list'][index + 1];
                            final time =
                                DateTime.parse(hourlyForeCast['dt_txt']);
                            final double temp = hourlyForeCast['main']['temp'];
                            return ForeCastCard(
                                time: DateFormat.j().format(time),
                                value:
                                    '${(temp - 273.15).toStringAsFixed(2)}°C',
                                icon: hourlyForeCast['weather'][0]['main'] ==
                                            'Clouds' ||
                                        hourlyForeCast['weather'][0]['main'] ==
                                            'Rain'
                                    ? Icons.cloud
                                    : Icons.sunny);
                          }),
                    ),

                    const Text(
                      'Additional Information',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        AdditionalInfo(
                            label: "Humidity",
                            value: humidity.toString(),
                            icon: Icons.water_drop),
                        AdditionalInfo(
                            label: "Wind Speed",
                            value: windSpeed.toString(),
                            icon: Icons.air_rounded),
                        AdditionalInfo(
                            label: "pressure",
                            value: pressure.toString(),
                            icon: Icons.beach_access),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}

class ForeCastCard extends StatelessWidget {
  final String time;
  final String value;
  final IconData icon;
  const ForeCastCard(
      {super.key, required this.time, required this.value, required this.icon});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120,
      child: Card(
        elevation: 10,
        child: Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 10),
          child: Column(
            spacing: 10,
            children: [
              Text(
                time,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Icon(
                icon,
                size: 32,
              ),
              Text(value)
            ],
          ),
        ),
      ),
    );
  }
}

class AdditionalInfo extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;

  const AdditionalInfo(
      {super.key,
      required this.label,
      required this.value,
      required this.icon});
  @override
  Widget build(BuildContext context) {
    return Column(spacing: 10, children: [
      Icon(
        icon,
        size: 32,
      ),
      Text(label, style: TextStyle(fontSize: 18)),
      Text(
        value,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    ]);
  }
}
