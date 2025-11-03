import 'package:flutter/material.dart';
import 'package:shop_app/models/product_model.dart';
import 'package:shop_app/screens/home_screen.dart';
import 'package:shop_app/services/update_product_service.dart';
import 'package:shop_app/widgets/customTextField.dart';
import 'package:shop_app/widgets/custom_button.dart';
import 'package:shop_app/widgets/messanger_snackBar.dart';

// ignore: must_be_immutable
class UpdateScreen extends StatelessWidget {
  UpdateScreen({super.key});
  static String id = 'UpdateScreen';

  dynamic productId;
  String? productName;
  dynamic productPrice;
  String? productDesc;
  String? productCategory;
  GlobalKey<FormState> formkey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    ProductModel product =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    return Scaffold(
      appBar: AppBar(title: Text('All Products'), centerTitle: true),
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomTextField(
                  hintText: 'ex : 7',
                  labelText: 'id',
                  prefixIcon: Icon(Icons.grid_3x3_outlined),
                  isPassword: false,
                  keyboardType: TextInputType.text,
                  // myController: null,
                  onChanged: (String id) {
                    productId = id;
                  },
                ),
                CustomTextField(
                  hintText: 'ex : Mobile',
                  labelText: 'Name (Optional)',
                  prefixIcon: Icon(Icons.title),
                  isPassword: false,
                  keyboardType: TextInputType.text,
                  // myController: null,
                  onChanged: (String name) {
                    productName = name;
                  },
                ),
                CustomTextField(
                  hintText: 'ex : 5000',
                  labelText: 'Price (Optional)',
                  prefixIcon: Icon(Icons.attach_money_outlined),
                  isPassword: false,
                  keyboardType: TextInputType.number,
                  // myController: null,
                  onChanged: (dynamic price) {
                    productPrice = price;
                  },
                ),
                CustomTextField(
                  hintText: 'ex : nice',
                  labelText: 'Description (Optional)',
                  prefixIcon: Icon(Icons.description),
                  isPassword: false,
                  keyboardType: TextInputType.text,
                  // myController: null,
                  onChanged: (String desc) {
                    productDesc = desc;
                  },
                ),
                CustomTextField(
                  hintText: 'ex : electronics',
                  labelText: 'Category (Optional)',
                  prefixIcon: Icon(Icons.category),
                  isPassword: false,
                  keyboardType: TextInputType.text,
                  // myController: TextEditingController(),
                  onChanged: (String category) {
                    productCategory = category;
                  },
                ),
                SizedBox(height: 20),
                CustomButton(
                  titleButton: 'Update',
                  onTap: () {
                    if (formkey.currentState!.validate()) {
                      UpdateProductService().updateProduct(
                        id: productId!,
                        productName: productName ?? product.productName,
                        productPrice: productPrice ?? product.productPrice,
                        productDesc: productDesc ?? product.desc,
                        productCategory: productCategory ?? product.category,
                      );
                      Navigator.pushReplacementNamed(context, HomeScreen.id);
                      showSnackBarMessage(
                        context,
                        backgroundColor: Colors.green,
                        message: 'Product Updated.',
                        icon: Icons.assignment_turned_in,
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
