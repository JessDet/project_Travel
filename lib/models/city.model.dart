import 'package:project/models/todo.model.dart';

class City {
  String name;
  String image;
  List<ToDo> todos;

  City({required this.name, required this.image, required this.todos});
}
