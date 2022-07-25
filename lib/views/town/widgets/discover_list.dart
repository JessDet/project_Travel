import 'package:flutter/material.dart';
import './visit_card.dart';
import '../../../models/todo.model.dart';

class DiscoverList extends StatelessWidget {
  final List<ToDo> todo;
  final List<ToDo> selectedVisit;
  final Function toggleVisit;

  DiscoverList(
      {required this.todo,
      required this.selectedVisit,
      required this.toggleVisit});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
        mainAxisSpacing: 1,
        crossAxisSpacing: 1,
        crossAxisCount: 2,
        children: todo
            .map((t) => VisitCard(
                todo: t,
                isSelected: selectedVisit.contains(t),
                toggleVisit: () {
                  toggleVisit(t);
                }))
            .toList());
  }
}
