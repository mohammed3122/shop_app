import 'package:flutter/material.dart';
import 'package:shop_app/screens/home_screen.dart';
import 'package:shop_app/services/add_product_service.dart';
import 'package:shop_app/widgets/customTextField.dart';
import 'package:shop_app/widgets/custom_button.dart';
import 'package:shop_app/widgets/messanger_snackBar.dart';

// ignore: must_be_immutable
class AddScreen extends StatelessWidget {
  static String id = 'AddScreen';
  AddScreen({super.key});
  String? productName;
  dynamic productPrice;
  String? productDesc;
  String? productCategory;
  GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Product'), centerTitle: true),

      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomTextField(
                  hintText: 'ex : Mobile',
                  labelText: 'Enter Product Name',
                  prefixIcon: Icon(Icons.title),
                  isPassword: false,
                  keyboardType: TextInputType.text,
                  // myController: null,
                  onChanged: (name) {
                    productName = name;
                  },
                ),
                CustomTextField(
                  hintText: 'ex : 5000',
                  labelText: 'Enter Product Price',
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
                  labelText: 'Enter Description (Optional)',
                  prefixIcon: Icon(Icons.description),
                  isPassword: false,
                  keyboardType: TextInputType.text,
                  // myController: null,
                  onChanged: (desc) {
                    productDesc = desc;
                  },
                ),
                CustomTextField(
                  hintText: 'ex : electronics',
                  labelText: 'Enter Product Category',
                  prefixIcon: Icon(Icons.category),
                  isPassword: false,
                  keyboardType: TextInputType.text,
                  // myController: null,
                  onChanged: (category) {
                    productCategory = category;
                  },
                ),
                SizedBox(height: 20),
                CustomButton(
                  titleButton: 'Add',
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      AddProductService().addProduct(
                        productName: productName!,
                        productPrice: productPrice,
                        productDesc: productDesc ?? '',
                        productCategory: productCategory!,
                      );
                      Navigator.pushReplacementNamed(context, HomeScreen.id);
                      showSnackBarMessage(
                        context,
                        backgroundColor: Colors.green,
                        message: 'Product Added.',
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
