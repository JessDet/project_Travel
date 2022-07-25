import 'package:flutter/cupertino.dart';
import 'package:project/models/todo.model.dart';

class Travel {
  late String id;
  String city;
  DateTime date;
  List<ToDo> activitiesToDo;

  Travel(
      {required this.city, required this.activitiesToDo, required this.date}) {
        this.id = UniqueKey().toString();
      }
}
