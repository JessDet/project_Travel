import 'package:flutter/material.dart';
import 'package:project/models/city.model.dart';
import 'package:project/models/todo.model.dart';
import 'package:project/models/travel.model.dart';
import 'package:project/providers/city_provider.dart';
import 'package:project/providers/trip_provider.dart';
import 'package:project/root_widgets/Drawer.dart';
import 'package:project/views/home/home.dart';
import 'package:project/views/town/widgets/choice_list.dart';
import 'package:project/views/town/widgets/discover_list.dart';
import 'package:project/views/town/widgets/travel_view.dart';
import 'package:provider/provider.dart';

class Town extends StatefulWidget {
  static String routeName = '/town';

  showContext({required BuildContext context, required List<Widget> children}) {
    var orientation = MediaQuery.of(context).orientation;
    if (orientation == Orientation.landscape) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: children,
      );
    } else {
      return Column(
        children: children,
      );
    }
  }

  @override
  State<Town> createState() => _TownState();
}

class _TownState extends State<Town> {
  late Travel ourTravel;
  late int index;

  @override
  void initState() {
    ourTravel = Travel(
      city: '',
      activitiesToDo: [],
      date: DateTime(2017, 9, 7, 17, 30),
    );
    index = 0;
  }

  double get amount {
    //equivalent à reduce
    return ourTravel.activitiesToDo.fold(0.00, (previousValue, element) {
      return previousValue + element.price;
    });
  }

  void toggleVisit(ToDo todo) {
    setState(() {
      ourTravel.activitiesToDo.contains(todo)
          ? ourTravel.activitiesToDo.remove(todo)
          : ourTravel.activitiesToDo.add(todo);
    });

    print(ourTravel.activitiesToDo);
  }

  void deleteChoiceVisit(ToDo todo) {
    setState(() {
      ourTravel.activitiesToDo.remove(todo);
    });
  }

  void setDate() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now().add(Duration(days: 1)),
            firstDate: DateTime.now(),
            lastDate: DateTime(2023))
        .then((newDate) => {
              if (newDate != null)
                {
                  setState(() {
                    ourTravel.date = newDate;
                  })
                }
            });
  }

  void switchIndex(newIndex) {
    setState(() {
      index = newIndex;
    });
  }

  void saveOurTravel(String cityName) {
    showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            contentPadding: EdgeInsets.all(10),
            title: Text('Sauvegardez votre voyage ?'),
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context, 'cancel');
                    },
                    child: Text('Annuler'),
                    style: ElevatedButton.styleFrom(
                        primary: Theme.of(context).errorColor),
                  ),
                  SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context, 'save');
                    },
                    child: Text('Sauvegarder'),
                  )
                ],
              )
            ],
          );
        }).then((value) {
      if (value == 'save') if (ourTravel.date ==
          DateTime(2017, 9, 7, 17, 30, 00, 000)) {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Attention'),
              content: Text('Vous n\'avez pas choisi de date'),
              actions: [
                TextButton(
                  child: Text('OK'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                )
              ],
            );
          },
        );
      } else {
        ourTravel.city = cityName;
        Provider.of<TripProvider>(context, listen: false).addTrip(ourTravel);
        Navigator.pushNamed(context, Home.routeName);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    String? cityName = ModalRoute.of(context)!.settings.arguments as String;
    City city = Provider.of<CityProvider>(context).getCityByName(cityName);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Notre Voyage'),
          actions: <Widget>[Icon(Icons.more_vert)],
        ),
        drawer: OurDrawer(),
        body: Container(
          padding: const EdgeInsets.all(10),
          child: widget.showContext(
            context: context,
            children: [
              TravelView(
                  ourTravel: ourTravel,
                  setDate: setDate,
                  cityName: city.name,
                  amount: amount),
              Expanded(
                child: index == 0
                    ? DiscoverList(
                        todo: city.todos,
                        toggleVisit: toggleVisit,
                        selectedVisit: ourTravel.activitiesToDo,
                      )
                    : ChoiceList(
                        activities: ourTravel.activitiesToDo,
                        deleteChoiceVisit: deleteChoiceVisit,
                      ),
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.forward),
          onPressed: () {
            saveOurTravel(cityName);
          },
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: index,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.map),
              label: 'A découvrir',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.stars),
              label: 'Mes visites',
            ),
          ],
          onTap: (value) {
            print(value);
            switchIndex(value);
          },
        ));
  }
}
