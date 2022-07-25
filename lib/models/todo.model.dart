
enum ActivityStatus {encours, realise}

class ToDo {
  String name;
  String image;
  String id;
  String city;
  double price;
  ActivityStatus status;

  ToDo(
    {required this.name,
    required this.image,
    required this.id,
    required this.city,
    required this.price,
    }) : status = ActivityStatus.encours;

    
}
