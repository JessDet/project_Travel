import 'package:project/models/travel.model.dart';

import '../models/todo.model.dart';
import '../models/city.model.dart';

List<City> cities = [
  City(
    name: 'Paris',
    image: 'assets/paris.jpg',
    todos: [
      ToDo(
          image: 'assets/visites/louvre.jpg',
          name: 'Le Louvre',
          price: 12.99,
          id: 'a1',
          city: 'Paris'),
      ToDo(
          image: 'assets/visites/arc.jpg',
          name: 'L\'Arc de Triomphe',
          price: 15.00,
          id: 'a2',
          city: 'Paris'),
      ToDo(
          image: 'assets/visites/notre_dame.jpg',
          name: 'Notre Dame',
          price: 0.00,
          id: 'a3',
          city: 'Paris'),
      ToDo(
          image: 'assets/visites/eiffel.jpg',
          name: 'La Tour Eiffel',
          price: 29.50,
          id: 'a4',
          city: 'Paris'),
      ToDo(
          image: 'assets/visites/montmartre.jpg',
          name: 'Montmartre',
          price: 0.00,
          id: 'a5',
          city: 'Paris'),
      ToDo(
          image: 'assets/visites/sacre_coeur.jpg',
          name: 'La basilique de Sacré Coeur',
          price: 8.00,
          id: 'a6',
          city: 'Paris'),
    ],
  ),
  City(
    name: 'Marseille',
    image: 'assets/marseille.jpg',
    todos: [
      ToDo(
          image: 'assets/visites/calanques.jpg',
          name: 'Les calanques',
          price: 0.00,
          id: 'b1',
          city: 'Marseille'),
      ToDo(
          image: 'assets/visites/forteresse-fort-pierre.jpg',
          name: 'La forteresse',
          price: 10.00,
          id: 'b2',
          city: 'Marseille'),
      ToDo(
          image: 'assets/visites/notre_dame_om.jpg',
          name: 'Notre Dame de la garde',
          price: 5.00,
          id: 'b3',
          city: 'Marseille'),
      ToDo(
          image: 'assets/visites/stade.jpg',
          name: 'Le stade Vélodrome',
          price: 19.99,
          id: 'bb4',
          city: 'Marseille'),
    ],
  ),
  City(
    name: 'Calais',
    image: 'assets/wissant.jpg',
    todos: [
      ToDo(
          image: 'assets/visites/bourgeois.jpg',
          name: 'Les 6 bourgeois de Calais',
          price: 2.99,
          id: 'c1',
          city: 'Calais'),
      ToDo(
          image: 'assets/visites/dragon.jpg',
          name: 'Le dragon',
          price: 20.00,
          id: 'c2',
          city: 'Calais'),
    ],
  ),
];

List<Travel> mytrips = [
  Travel(
      city: 'Paris',
      activitiesToDo: [],
      date: DateTime.now().add(Duration(days: 1))),
  Travel(
      city: 'Marseille',
      activitiesToDo: [],
      date: DateTime.now().subtract(Duration(days: 1))),
  Travel(
      city: 'Calais',
      activitiesToDo: [],
      date: DateTime.now().add(Duration(days: 1))),
];
