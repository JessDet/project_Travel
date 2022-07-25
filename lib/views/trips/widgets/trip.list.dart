import 'package:flutter/material.dart';
import 'package:project/models/travel.model.dart';
import 'package:intl/intl.dart';
import 'package:project/views/onetrip/onetrip.dart';

class TripList extends StatelessWidget {
  final List<Travel> trips;

  TripList({required this.trips});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: trips.length,
      itemBuilder: ((context, index) {
        var trip = trips[index];
        return ListTile(
          title: Text(trip.city),
          subtitle: trip.date != null
              ? Text(DateFormat('d/M/y').format(trip.date))
              : null,
          trailing: const Icon(Icons.info),
          onTap: () {
            Navigator.pushNamed(
              context,
              OneTrip.routeName,
              arguments: {
                'tripId' : trip.id,
                'cityName' : trip.city,
              }
            );
          },
        );
      }),
    );
  }
}
