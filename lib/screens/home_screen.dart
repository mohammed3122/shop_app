import 'package:flutter/material.dart';
import 'package:shop_app/models/product_model.dart';
import 'package:shop_app/screens/add_product_screen.dart';
import 'package:shop_app/screens/search_screen.dart';
import 'package:shop_app/services/get_all_products.dart';
import 'package:shop_app/widgets/card_widget.dart';
import 'package:shop_app/widgets/custom_button.dart';
import 'package:shop_app/widgets/loading.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static String id = 'HomeScreen';
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: GetAllProductsServices().getAllProducts(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<ProductModel> procucts = snapshot.data!;
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: Icon(Icons.search, color: Color(0xffaeaeae), size: 30),
                onPressed: () {
                  Navigator.pushNamed(context, SearchScreen.id);
                },
              ),
              title: Text('All Products'),
              centerTitle: true,
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 30.0),
                  child: Icon(Icons.shopping_cart),
                ),
              ],
            ),
            body: Padding(
              padding: const EdgeInsets.only(top: 50, right: 20, left: 20),
              child: GridView.builder(
                itemCount: procucts.length,
                clipBehavior: Clip.none,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.5,
                  mainAxisSpacing: 60,
                  crossAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  return CardWidget(product: procucts[index]);
                },
              ),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.startFloat,
            floatingActionButton: CustomButton(
              width: 80,
              titleButton: "+",
              onTap: () {
                Navigator.pushNamed(context, AddScreen.id);
              },
            ),
          );
        } else if (snapshot.hasError) {
          return Scaffold(body: Center(child: Text('Sorry There is An Error')));
        } else {
          return Scaffold(body: Center(child: LoadingWidget(isScreen: true)));
        }
      },
    );
  }
}
