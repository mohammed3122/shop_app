import 'package:flutter/material.dart';
import 'package:shop_app/services/get_all_categories.dart';
import 'package:shop_app/views/result_products_view.dart';
import 'package:shop_app/widgets/category_tab.dart';
import 'package:shop_app/widgets/customTextField.dart';

String? productCategory;

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});
  static String id = 'SearchScreen';

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Search Categories'), centerTitle: true),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 30),
            // 🔹 مربع البحث
            CustomTextField(
              hintText: 'ex : electronics',
              labelText: 'Enter Category',
              prefixIcon: const Icon(Icons.search),
              isPassword: false,
              keyboardType: TextInputType.text,
              onChanged: (category) {
                setState(() {
                  productCategory = category.trim();
                });
              },
            ),
            const SizedBox(height: 20),
            // 🔹 التابات الخاصة بالفئات
            // TapsView(),
            FutureBuilder(
              future: GetAllCategories().getAllCategories(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List categories = snapshot.data;
                  return SizedBox(
                    height: 60,
                    child: ListView.separated(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      scrollDirection: Axis.horizontal,
                      itemCount: categories.length,
                      separatorBuilder: (context, index) =>
                          const SizedBox(width: 10),
                      itemBuilder: (context, index) {
                        final title = categories[index];
                        final isSelected = productCategory == title;
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              productCategory = title;
                            });
                          },
                          child: CategoryTab(
                            title: title,
                            color: isSelected
                                ? Colors.blue.shade200
                                : Colors.grey.shade300,
                            key: ValueKey(title),
                          ),
                        );
                      },
                    ),
                  );
                } else if (snapshot.hasError) {
                  return const Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Text('Error loading categories'),
                  );
                } else {
                  return const Padding(
                    padding: EdgeInsets.all(20.0),
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
            const SizedBox(height: 20),
            const Divider(indent: 25, endIndent: 25),
            SizedBox(height: 30),
            // 🔹 عرض المنتجات
            ResultProductsView(),
          ],
        ),
      ),
    );
  }
}
