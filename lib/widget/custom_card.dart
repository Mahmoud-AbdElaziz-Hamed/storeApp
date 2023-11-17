import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:storeapp/models/product_model.dart';
import 'package:storeapp/screens/updat_product_page.dart';
import 'package:storeapp/services/add_product_to_cart.dart';

// ignore: must_be_immutable
class CustomCard extends StatelessWidget {
  CustomCard({super.key, required this.product});
  ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
                blurRadius: 60,
                offset: const Offset(10, 10),
                color: Colors.grey.withOpacity(0.2)),
          ]),
          height: 130,
          width: 220,
          child: Card(
            elevation: 10,
            margin: const EdgeInsets.all(5),
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      Text(
                        product.title.substring(0, 15),
                        style:
                            const TextStyle(color: Colors.grey, fontSize: 16),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        r"$" " ${product.price.toString()}",
                        style:
                            const TextStyle(color: Colors.grey, fontSize: 16),
                      ),
                      const Icon(
                        FontAwesomeIcons.solidHeart,
                        color: Colors.red,
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        // image of product
        Positioned(
          top: -30,
          left: 80,
          height: 80,
          width: 100,
          child: Image.network(product.image),
        ),
        // eidt button
        Positioned(
            top: -10,
            left: 5,
            height: 30,
            width: 30,
            child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, UpdateProductPage.ID,
                      arguments: product);
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: const Color.fromARGB(255, 187, 204, 235)),
                  child: const Icon(
                    Icons.edit,
                  ),
                ))),
        //add button
        Positioned(
            top: -10,
            left: 40,
            height: 30,
            width: 30,
            child: GestureDetector(
                onTap: () {
                  Cart().addToCart(product);
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: const Color.fromARGB(255, 187, 204, 235)),
                  child: const Icon(
                    Icons.add,
                  ),
                )))
      ],
    );
  }
}
