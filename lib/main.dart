import 'package:flutter/material.dart';
import 'package:project/providers/city_provider.dart';
import 'package:project/providers/trip_provider.dart';
import 'package:project/views/home/home.dart';
import 'package:project/views/onetrip/onetrip.dart';
import 'package:project/views/town/Town.dart';
import 'package:project/views/trips/trips.dart';
import 'package:provider/provider.dart';

main() {
  runApp(Holidays());
}

class Holidays extends StatefulWidget {
  @override
  HolidaysState createState() => HolidaysState();
}

class HolidaysState extends State<Holidays> {


  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: CityProvider()),
        ChangeNotifierProvider.value(value: TripProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => Home(),
          Town.routeName: (context) => Town(),
          Trips.routeName: (context) => Trips(),
          OneTrip.routeName: (context) => OneTrip(),
        },
      ),
    );
  }
}
