import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import '../views/home/Home.dart';
import '../views/trips/trips.dart';

class OurDrawer extends StatelessWidget {
  const OurDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Container(
              height: 200,
              // color: Theme.of(context).primaryColor,
              child: const Text(
                'Holidays',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
            ),
            decoration: BoxDecoration(
                gradient: LinearGradient(
              colors: [
                Theme.of(context).primaryColor,
                Theme.of(context).primaryColor.withOpacity(0.5),
              ],
              begin: Alignment.topLeft,
              end: Alignment.topRight,
            )),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Accueil'),
            onTap: () {
              Navigator.pushNamed(context, Home.routeName);
            },
          ),
          Divider(
            color: Colors.grey[600],
            indent: 20,
            endIndent: 20,
          ),
          ListTile(
            leading: Icon(Icons.flight),
            title: Text('Mes voyages'),
            onTap: () {
              Navigator.pushNamed(context, Trips.routeName);
            },
          )
        ],
      ),
    );
  }
}
