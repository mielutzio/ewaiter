import 'package:test/test.dart';

void main(){
  List<String> menuItemNames = ["item1", "item2", "item3"];

  test("Map created successfully", () async  {
    final Map<String, int> menuItemsCount = {
      for (var item in menuItemNames) item: 0
    };
    expect(menuItemsCount["item1"], 0);
  });
}