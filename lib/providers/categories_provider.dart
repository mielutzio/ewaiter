import 'package:ewaiter/models/menu_item.dart';
import 'package:ewaiter/models/menu_item_database.dart';
import 'package:flutter/material.dart';

class CategoriesProvider extends ChangeNotifier {
  final List<MenuItem> _menu = MenuItemDatabase.menu;
  final List<String> _categories = MenuItemDatabase.categories;
  
  String _selectedCategory = '';

  List<String> get categories => _categories;
  List<MenuItem> get menu => _menu;
  String get selectedCategory => _selectedCategory;

  void setCategory(String categoryName) {
    _selectedCategory = categoryName;
    notifyListeners();
  }

  List<String> fetchNamesByCategory() {
    return _menu
        .where((item) => item.category == selectedCategory)
        .map((item) => item.name)
        .toList();
  }
}
