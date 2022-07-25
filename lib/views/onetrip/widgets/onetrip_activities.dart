import 'package:flutter/material.dart';
import 'package:project/views/onetrip/widgets/onetrip_list.dart';

import '../../../models/todo.model.dart';

class OneTripActivities extends StatelessWidget {
  String tripId;

  OneTripActivities({required this.tripId});

  @override
  Widget build(BuildContext context) {
    print('BUID: ONETRIPACTIVITY');
    return DefaultTabController(
      length: 2,
      child: Column(children: [
        Container(
            child: TabBar(tabs: [
          Tab(
            text: 'En cours',
          ),
          Tab(
            text: 'Terminée',
          ),
        ])),
        Container(
          height: 600,
          child: TabBarView(children: [
            OneTripList(
              filter: ActivityStatus.encours,
              TripId: tripId,
            ),
            OneTripList(
              filter: ActivityStatus.realise,
              TripId: tripId,
            ),
          ]),
        )
      ]),
    );
  }
}
