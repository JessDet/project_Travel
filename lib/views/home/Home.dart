import 'package:flutter/material.dart';
import 'package:project/providers/city_provider.dart';
import 'package:project/views/home/widgets/CityCard.dart';
import 'package:provider/provider.dart';
import '../../models/city.model.dart';
import '../../root_widgets/Drawer.dart';

class Home extends StatefulWidget {
  static String routeName = '/';

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List<City> cities = Provider.of<CityProvider>(context).cities;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Holidays'),
        actions: <Widget>[
          Icon(Icons.more_vert),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            ...cities.map(
              (city) {
                return CityCard(city: city);
              },
            ),
          ],
        ),
      ),
      drawer: OurDrawer(),
    );
  }
}
