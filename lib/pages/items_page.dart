import 'package:flutter/material.dart';
import 'package:ewaiter/pages/order_page.dart';
import 'package:ewaiter/providers/categories_provider.dart';
import 'package:ewaiter/providers/counts_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final countsProvider = Provider.of<CountsProvider>(context);
    final categoriesProvider = Provider.of<CategoriesProvider>(context);

    List<String> keysWithSelectedCategory = categoriesProvider.menu.entries
        .where((entry) => entry.value == categoriesProvider.selectedCategory)
        .map((entry) => entry.key)
        .toList();

    return Scaffold(
      backgroundColor: Colors.amber[200],
      appBar: AppBar(
        title: Text(
          categoriesProvider.selectedCategory,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.amber[200],
      ),
      body: ListView.builder(
          itemCount: keysWithSelectedCategory.length,
          itemBuilder: (context, index) {
            final item = keysWithSelectedCategory.elementAt(index);
            final count = countsProvider.menuItemsCount[item]!;
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 3),
              child: ListTile(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                  side: const BorderSide(
                    color: Colors.black,
                    width: 1,
                  )
                  
                ),
                tileColor: Colors.grey[200],
                title: Text(item),
                trailing: Text(count > 0 ? count.toString() : '', style: const TextStyle(fontWeight: FontWeight.bold)),
                onTap: () {
                  countsProvider.incrementCounter(item);
                },
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const OrderPage(),
              ));
        },
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: const BorderSide(
              color: Colors.black,
              width: 1.0,
            )),
        backgroundColor: Colors.red[200],
        foregroundColor: Colors.black,
        child: const Icon(Icons.check),
      ),
    );
  }
}
