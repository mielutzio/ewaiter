import 'dart:io';
import 'package:ewaiter/models/menu_item.dart';
import 'package:isar/isar.dart';
import 'dart:convert';

import 'package:path_provider/path_provider.dart';

class MenuItemDatabase {
  static late Isar isar;
  static List<String> categories = [];
  static List<String> menuItemNames = [];
  static List<MenuItem> menu = [];

  // Initilize database
  static Future<void> initilize() async {
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open(
      [MenuItemSchema],
      directory: dir.path,
    );

    final objectCount = await isar.menuItems.count();
    if (objectCount == 0) {
      await populateDatabase();
    }

    await fetchMenuItems();
    await fetchCategories();
    await fetchNames();

    isar.close();
  }

  // Create
  static Future<void> populateDatabase() async {
    List<MenuItem> menuItemList = await readJson();

    await isar.writeTxn(() async {
      await isar.menuItems.putAll(menuItemList);
    });
  }

  // Read
  static Future<void> fetchMenuItems() async {
    menu = await isar.menuItems.where().findAll();
  }

  static Future<void> fetchCategories() async {
    categories = await isar.menuItems
        .where()
        .distinctByCategory()
        .categoryProperty()
        .findAll();
  }

  static Future<void> fetchNames() async {
    menuItemNames = await isar.menuItems.where().nameProperty().findAll();
  }

  // Load data from JSON into database
  static Future<List<MenuItem>> readJson() async {
    String jsonString = await File('lib/assets/menu.json').readAsString();
    List<dynamic> jsonData = jsonDecode(jsonString);
    return jsonData.map((data) => MenuItem.fromJson(data)).toList();
  }
}
