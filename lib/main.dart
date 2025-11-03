import 'package:flutter/material.dart';
import 'package:shop_app/screens/add_product_screen.dart';
import 'package:shop_app/screens/search_screen.dart';
import 'package:shop_app/screens/update_screen.dart';
import 'package:shop_app/screens/home_screen.dart';

void main() {
  runApp(ShopApp());
}

class ShopApp extends StatelessWidget {
  const ShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        HomeScreen.id: (context) => HomeScreen(),
        UpdateScreen.id: (context) => UpdateScreen(),
        SearchScreen.id: (context) => SearchScreen(),
        AddScreen.id: (context) => AddScreen(),
        // HomeScreen.id: (context) => HomeScreen(),
      },

      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
