import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../models/travel.model.dart';

class TravelView extends StatelessWidget {
  final VoidCallback setDate;
  final Travel ourTravel;
  final String cityName;
  final double amount;

  TravelView({required this.ourTravel, required this.setDate, required this.cityName, required this.amount});


  @override
  Widget build(BuildContext context) {
    var orientation = MediaQuery.of(context).orientation;
    var size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.all(10),
      height: 150,
      width: orientation == Orientation.landscape
          ? size.width * 0.5
          : double.infinity,
      color: Colors.white,
      child: Column(
        children: <Widget>[
           Text(
            cityName,
            style: TextStyle(
              fontSize: 25,
              decoration: TextDecoration.underline,
            ),
          ),
          const SizedBox(height: 15),
          Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  DateFormat('d/M/y').format(ourTravel.date),
                  style: const TextStyle(fontSize: 20),
                ),
              ),
              ElevatedButton(
                onPressed: setDate,
                style: ElevatedButton.styleFrom(
                  primary: Colors.pinkAccent,
                ),
                child: const Text(
                  'Date',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          Row(
            children: [
              const Expanded(
                child: Text(
                  'Montant par personne',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              Text(' $amount €',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
