import 'dart:collection';

import 'package:flutter/widgets.dart';
import 'package:flutter/foundation.dart';
import 'package:project/models/todo.model.dart';
import 'package:project/models/travel.model.dart';
import '../datas/data.dart' as data;

class TripProvider with ChangeNotifier {
  final List<Travel> _trips = data.mytrips;

  UnmodifiableListView<Travel> get trips => UnmodifiableListView(_trips);

  void addTrip(Travel travel) {
    _trips.add(travel);
    notifyListeners();
  }

  Travel getId(String tripId) {
    return trips.firstWhere((trip) => trip.id == tripId);
  }

  void setActivityToDone(ToDo activity) {
    activity.status = ActivityStatus.realise;
    notifyListeners();
  }
}
