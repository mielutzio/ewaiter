import "package:isar/isar.dart";

part 'menu_item.g.dart';

@collection
class MenuItem {
  Id id = Isar.autoIncrement;
  late String name;
  late String category;

  MenuItem({required this.name, required this.category});

  factory MenuItem.fromJson(Map<String, dynamic> json){
    return MenuItem(
      name: json['name'],
      category: json['category'],
    );
  }
}
