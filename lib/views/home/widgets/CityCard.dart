import 'package:flutter/material.dart';
import 'package:project/models/city.model.dart';

class CityCard extends StatelessWidget {
  final City city;

  CityCard({required this.city});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      child: InkWell(
        onTap: () {
          print('tap');
        },
        child: Container(
          height: 200,
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Ink.image(
                fit: BoxFit.cover,
                image: AssetImage(city.image),
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      '/town',
                      arguments: city.name,
                    );
                  },
                ),
              ),
              Positioned(
                top: 10,
                left: 10,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 5,
                  ),
                  child: Text(
                    city.name,
                    style: TextStyle(
                      fontSize: 35,
                      color: Colors.white,
                      backgroundColor: Colors.black26,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



// import 'package:flutter/material.dart';

// class City extends StatelessWidget {
//   // attributs
//   final String name;
//   final String image;
//   final bool checked;
//   final VoidCallback updateChecked;

//   // constructor
//   City(
//       {required this.name,
//       required this.image,
//       required this.checked,
//       required this.updateChecked});

//   @override
//   Widget build(BuildContext context) {
//     return Card(  
//       elevation: 6,
//       child: InkWell(onTap: () {
//         /// Calling the function that was passed in as a parameter.
//         updateChecked();
//           },
//       child: Container(
//         height: 200,
//         child: Stack(
//           fit: StackFit.expand,
//           children: <Widget>[
//             Ink.image(
//                 fit: BoxFit.cover,
//                 image: AssetImage(image),
//                 child: InkWell(onTap: () {
//                 },
//                 ),     
//                 ),
//             // Image.asset('assets/paris.jpg', fit: BoxFit.cover),
//             Padding(
//               padding: EdgeInsets.all(10),
//               child: Column(
//                 children: <Widget>[
//                   Expanded(
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.end,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: <Widget>[
//                         Icon(checked ? Icons.star : Icons.star_border,
//                             size: 40, color: Colors.white),
//                       ],
//                     ),
//                   ),
//                   Row(
//                     children: <Widget>[
//                       Text(
//                         name,
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 30,
//                         ),
//                       ),
//                     ],
//                   )
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     ), 

//     );
//   }
// }
