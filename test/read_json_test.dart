import 'dart:convert';
import 'dart:io';
import 'package:ewaiter/models/menu_item.dart';
import 'package:test/test.dart';

void main() {
  test("Json successfully read", () async {
    List<MenuItem> menuItemsList = await readJson();

    expect(menuItemsList[0].name, "DIAVOLA");
  }); 
}

Future<List<MenuItem>> readJson() async {
  String jsonString = await File('test/assets/menu.json').readAsString();
  List<dynamic> jsonData = jsonDecode(jsonString);
  return jsonData.map((data) => MenuItem.fromJson(data)).toList();
}
