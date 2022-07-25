import 'package:flutter/material.dart';
import 'package:project/models/travel.model.dart';
import 'package:project/providers/trip_provider.dart';
import 'package:project/root_widgets/Drawer.dart';
import 'package:project/views/trips/widgets/trip.list.dart';
import 'package:provider/provider.dart';

class Trips extends StatelessWidget {
  static String routeName = '/trips';

  @override
  Widget build(BuildContext context) {
    List<Travel> trips = Provider.of<TripProvider>(context).trips;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Mes voyages'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Prévisions'),
              Tab(text: 'Archivés'),
            ],
          ),
        ),
        drawer: OurDrawer(),
        body: Container(
          alignment: Alignment.center,
          child: TabBarView(
            children: [
              TripList(
                trips: trips
                    .where((trip) => DateTime.now().isBefore(trip.date))
                    .toList(),
              ),
              TripList(
                trips: trips
                    .where((trip) => DateTime.now().isAfter(trip.date))
                    .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
