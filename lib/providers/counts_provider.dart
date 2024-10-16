import 'package:ewaiter/models/menu_item_database.dart';
import 'package:flutter/material.dart';

class CountsProvider extends ChangeNotifier {
  final Map<String, int> _menuItemsCount = {
    for (var item in MenuItemDatabase.menuItemNames) item: 0
  };

  Map<String, int> get menuItemsCount => _menuItemsCount;

  void incrementCounter(String item) {
    menuItemsCount[item] = (_menuItemsCount[item] ?? 0) + 1;
    notifyListeners();
  }

  Map<String, int> getSelectedItems() {
    return Map.fromEntries(
        _menuItemsCount.entries.where((entry) => entry.value > 0));
  }

  void resetCounts() {
    _menuItemsCount.updateAll((key, value) => 0);
    notifyListeners();
  }
}
