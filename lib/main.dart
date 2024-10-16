import 'package:ewaiter/models/menu_item_database.dart';
import 'package:flutter/material.dart';
import 'package:ewaiter/pages/filters_page.dart';
import 'package:ewaiter/providers/categories_provider.dart';
import 'package:ewaiter/providers/counts_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  // inititialize menu item isar database
  WidgetsFlutterBinding.ensureInitialized();

  await MenuItemDatabase.initilize();

  runApp(MultiProvider(
     providers: [
        ChangeNotifierProvider(create: (_) => CountsProvider()),
        ChangeNotifierProvider(create: (_)=> CategoriesProvider())
      ],
      child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: true,
      home: FiltersPage(),
    );
  }
}
