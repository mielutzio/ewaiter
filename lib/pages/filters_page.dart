import 'package:flutter/material.dart';
import 'package:ewaiter/pages/items_page.dart';
import 'package:ewaiter/providers/categories_provider.dart';
import 'package:provider/provider.dart';

class FiltersPage extends StatelessWidget {
  const FiltersPage({super.key});

  @override
  Widget build(BuildContext context) {
    final categoriesProvider = Provider.of<CategoriesProvider>(context);
    final categories = categoriesProvider.categories;

    return Scaffold(
        backgroundColor: Colors.amber[200],
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text(
            "Menu Categories",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.amber[200],
        ),
        body: GridView.count(
          crossAxisCount: 3,
          children: List.generate(categories.length, (index) {
            return InkWell(
              onTap: () {
                categoriesProvider.setCategory(categories[index]);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const ItemsPage()));
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey[200], //colors[index % colors.length],
                      ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                            child: Image.asset(
                                "lib/assets/filter_icons/${categories[index]}.png",
                                fit: BoxFit.contain)),
                        const SizedBox(height: 10),
                        Flexible(
                          child: Text(categories[index],
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
        ));
  }
}
