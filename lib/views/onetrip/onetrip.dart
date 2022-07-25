import 'dart:js';

import 'package:flutter/material.dart';
import 'package:project/models/travel.model.dart';
import 'package:project/providers/city_provider.dart';
import 'package:project/providers/trip_provider.dart';
import 'package:project/views/onetrip/widgets/onetrip_activities.dart';
import 'package:project/views/onetrip/widgets/onetrip_city_bar.dart';
import 'package:provider/provider.dart';
import '../../models/city.model.dart';

class OneTrip extends StatelessWidget {
  static String routeName = '/onetrip';

  @override
  Widget build(BuildContext context) {
    print('BUID: ONETRIP');
    String cityName = (ModalRoute.of(context)!.settings.arguments
        as Map<String, dynamic>)['cityName'];
    String tripId = (ModalRoute.of(context)!.settings.arguments
        as Map<String, dynamic>)['tripId'];
    City city = Provider.of<CityProvider>(context).getCityByName(cityName);
    Travel trip = Provider.of<TripProvider>(context).getId(tripId);
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
          child: Column(
        children: [
          OneTripCityBar(city: city),
          OneTripActivities(
            tripId: tripId,
          )
        ],
      )),
    ));
  }
}
