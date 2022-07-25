import 'package:flutter/material.dart';
import '../../../models/todo.model.dart';

class ChoiceList extends StatelessWidget {
  final List<ToDo> activities;
  final Function deleteChoiceVisit;

  ChoiceList({required this.activities, required this.deleteChoiceVisit});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView.builder(
      itemBuilder: (context, index) {
        var activity = activities[index];
        return Card(
          child: ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(activity.image),
            ),
            title: Text(activity.name),
            subtitle: Text(activity.city),
            trailing: IconButton(
              icon: Icon(
                Icons.delete,
                color: Colors.redAccent,
              ),
              onPressed: () {
                deleteChoiceVisit(activity);
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text('Activité supprimée'),
                  backgroundColor: Colors.red,
                  duration: Duration(seconds: 2),
                ));
              },
            ),
          ),
        );
      },
      itemCount: activities.length,
    ));
  }
}
