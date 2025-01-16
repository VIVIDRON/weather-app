import 'dart:ui';

import 'package:flutter/material.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

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
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: GestureDetector(
              child: const Icon(Icons.refresh),
              onTap: () {
                // print("refresh");
              },
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 25,
            children: [
              SizedBox(
                width: double.infinity,
                child: Card(
                  color: const Color.fromARGB(255, 40, 38, 38),
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                      child: const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            Text(
                              '303.5°F',
                              style: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Icon(
                              Icons.cloud,
                              size: 64,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Rain',
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
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ForeCastCard(),
                    ForeCastCard(),
                    ForeCastCard(),
                    ForeCastCard(),
                    ForeCastCard(),
                  ],
                ),
              ),
              const Text(
                'Additional Information',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(spacing: 10, children: [
                    Icon(Icons.water_drop , size: 32,),
                    Text("Humidity" , style : TextStyle(fontSize: 18) ),
                    Text("94" , style: TextStyle(fontSize : 20 , fontWeight: FontWeight.bold),),
                  ]),
                  Column(spacing: 10, children: [
                    Icon(Icons.air_rounded , size: 32,),
                    Text("Wind Speed" , style : TextStyle(fontSize: 18) ),
                    Text("7.67" , style: TextStyle(fontSize : 20 , fontWeight: FontWeight.bold),),
                  ]),
                  Column(spacing: 10, children: [
                    Icon(Icons.beach_access_rounded , size: 32,),
                    Text("Humidity" , style : TextStyle(fontSize: 18) ),
                    Text("1006" , style: TextStyle(fontSize : 20 , fontWeight: FontWeight.bold),),
                  ]),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ForeCastCard extends StatelessWidget {
  const ForeCastCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      child: Card(
        color: const Color.fromARGB(255, 40, 38, 38),
        elevation: 10,
        child: Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 10),
          child: Column(
            spacing: 10,
            children: [
              Text(
                '03:30',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Icon(
                Icons.cloud,
                size: 32,
              ),
              Text('320.12')
            ],
          ),
        ),
      ),
    );
  }
}
