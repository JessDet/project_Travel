import 'package:flutter/material.dart';
import 'package:project/models/todo.model.dart';
import 'package:project/models/travel.model.dart';
import 'package:project/providers/trip_provider.dart';
import 'package:provider/provider.dart';

class OneTripList extends StatelessWidget {
  String TripId;
  ActivityStatus filter;

  OneTripList({required this.TripId, required this.filter});

  @override
  Widget build(BuildContext context) {
    print('BUID: ONETRIPLIST');

    return Consumer<TripProvider>(builder: (context, tripProvider, child) {
      final Travel trip = Provider.of<TripProvider>(context).getId(TripId);
      final List<ToDo> activities = trip.activitiesToDo
          .where((element) => element.status == filter)
          .toList();
      return ListView.builder(
        itemCount: activities.length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: filter == ActivityStatus.encours
                ? Dismissible(
                    direction: DismissDirection.endToStart,
                    background: Container(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      alignment: Alignment.centerRight,
                      child: Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 30,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    key: ValueKey(activities[index].id),
                    child: Card(
                      child: ListTile(
                        title: Text(activities[index].name),
                      ),
                    ),
                    onDismissed: (_) {
                      Provider.of<TripProvider>(context, listen: false)
                          .setActivityToDone(activities[index]);
                    },
                  )
                : Card(
                    child: ListTile(
                      title: Text(activities[index].name,
                          style: TextStyle(color: Colors.cyan)),
                    ),
                  ),
          );
        },
      );
    });
  }
}
