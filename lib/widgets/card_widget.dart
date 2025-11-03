import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/models/product_model.dart';
import 'package:shop_app/screens/update_screen.dart';
import 'package:shop_app/widgets/loading.dart';

class CardWidget extends StatefulWidget {
  const CardWidget({super.key, required this.product});
  final ProductModel product;
  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  bool favorite = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          UpdateScreen.id,
          arguments: widget.product,
        );
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  blurRadius: 10,
                  // ignore: deprecated_member_use
                  color: Colors.black.withOpacity(0.1),
                  spreadRadius: 0,
                  offset: Offset(3, 8),
                ),
              ],
            ),

            child: Card(
              elevation: 0,
              child: Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      overflow: TextOverflow.ellipsis,
                      widget.product.productName,
                      style: TextStyle(
                        color: Color.fromARGB(255, 170, 170, 170),
                        fontSize: 18,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          r'$'
                          '${widget.product.productPrice}',
                          style: TextStyle(
                            fontSize: 20,
                            // fontWeight: FontWeight.bold,
                          ),
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.favorite,
                            color: favorite ? Colors.red : Color(0xff9e9e9e),
                          ),
                          onPressed: () {
                            setState(() {
                              favorite = !favorite;
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            left: 80,
            bottom: 80,
            child: SizedBox(
              height: 80,
              width: 60,
              child: CachedNetworkImage(
                imageUrl: widget.product.image,
                placeholder: (context, url) =>
                    Center(child: LoadingWidget(isScreen: false)),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
