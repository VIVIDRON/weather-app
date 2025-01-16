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
                              '120.5°F',
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
                    ForeCastCard(icon: Icons.cloud, time: '3:01', value: "443.4"),
                    ForeCastCard(icon: Icons.sunny, time: '3:01', value: "443.4"),
                    ForeCastCard(icon: Icons.cloud, time: '3:01', value: "443.4"),
                    ForeCastCard(icon: Icons.sunny, time: '3:01', value: "443.4"),
                    ForeCastCard(icon: Icons.cloud, time: '3:01', value: "443.4"),
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
                  AdditionalInfo(label: "Humidity", value: '74', icon: Icons.water_drop),
                  AdditionalInfo(label: "Wind Speed", value: '7.67', icon: Icons.air_rounded),
                  AdditionalInfo(label: "pressure", value: '1006', icon: Icons.beach_access),
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
  final String time;
  final String value;
  final IconData icon;
  const ForeCastCard({super.key, required this.time, required this.value, required this.icon });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
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
