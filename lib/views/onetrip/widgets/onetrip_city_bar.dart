import 'package:flutter/material.dart';

import '../../../models/city.model.dart';

class OneTripCityBar extends StatelessWidget {
  final City city;

  OneTripCityBar({required this.city});

  @override
  Widget build(BuildContext context) {
    print('BUID: ONETRIPCITYBAR');
    return Container(
      height: 200,
      child: Stack(
        fit: StackFit.expand,
        alignment: Alignment.center,
        children: [
          Image.asset(
            city.image,
            fit: BoxFit.cover,
          ),
          Container(
            color: Colors.black38,
            padding: EdgeInsets.symmetric(
              vertical: 30,
              horizontal: 10,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back,
                          size: 30,
                          color: Colors.white,
                        ))
                  ],
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(top: 30),
                    child: Text(
                      city.name,
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
