import 'package:flutter/material.dart';
import 'package:ewaiter/pages/filters_page.dart';
import 'package:ewaiter/providers/counts_provider.dart';
import 'package:provider/provider.dart';
import 'package:ewaiter/providers/categories_provider.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final countsProvider = Provider.of<CountsProvider>(context);
    final categoriesProvider = Provider.of<CategoriesProvider>(context);

    final selectedItems = countsProvider.getSelectedItems();
    return Scaffold(
      backgroundColor: Colors.amber[200],
      appBar: AppBar(
        title: const Text(
          'Order',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.amber[200],
      ),
      body: ListView.builder(
        itemCount: selectedItems.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 3),
            child: ListTile(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                  side: const BorderSide(
                    color: Colors.black,
                    width: 1,
                  )),
              tileColor: Colors.grey[200],
              title: Text(
                 "${categoriesProvider.menu.firstWhere((item) => item.name == selectedItems.keys.toList()[index]).category} ${selectedItems.keys.toList()[index]}"),
              trailing: Text(selectedItems.values.toList()[index].toString()),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          countsProvider.resetCounts();
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const FiltersPage()));
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: const BorderSide(
            color: Colors.black,
            width: 1,
          )

        ),
        backgroundColor: Colors.green[300],
        foregroundColor: Colors.black,
        child: const Icon(Icons.add),
      ),
    );
  }
}
