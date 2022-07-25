import 'dart:collection';

import 'package:flutter/widgets.dart';
import 'package:flutter/foundation.dart';

import '../models/city.model.dart';
import '../datas/data.dart' as data;

class CityProvider with ChangeNotifier {
  final List<City> _cities = data.cities;

  UnmodifiableListView<City> get cities => UnmodifiableListView(_cities);

  City getCityByName(String cityName) =>
      cities.firstWhere((city) => city.name == cityName);
}
