import 'package:flutter/material.dart';
import 'package:shop_app/models/product_model.dart';
import 'package:shop_app/screens/search_screen.dart';
import 'package:shop_app/services/get_product_of_categories.dart';
import 'package:shop_app/widgets/card_widget.dart';
import 'package:shop_app/widgets/loading.dart';

class ResultProductsView extends StatefulWidget {
  const ResultProductsView({super.key});

  @override
  State<ResultProductsView> createState() => _ResultProductsViewState();
}

class _ResultProductsViewState extends State<ResultProductsView> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: productCategory == null || productCategory!.isEmpty
          ? const Center(
              child: Text(
                'Please enter or select a category',
                style: TextStyle(fontSize: 16),
              ),
            )
          : FutureBuilder(
              future: GetProductOfCategories().getProductOfCategories(
                categoryName: productCategory!,
              ),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<ProductModel> products = snapshot.data!;
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 50,
                    ),
                    child: GridView.builder(
                      itemCount: products.length,
                      clipBehavior: Clip.none,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 1.5,
                            mainAxisSpacing: 60,
                            crossAxisSpacing: 10,
                          ),
                      itemBuilder: (context, index) {
                        return CardWidget(product: products[index]);
                      },
                    ),
                  );
                } else if (snapshot.hasError) {
                  return const Center(child: Text('Sorry, there was an error'));
                } else {
                  return const Center(child: LoadingWidget(isScreen: true));
                }
              },
            ),
    );
  }
}
