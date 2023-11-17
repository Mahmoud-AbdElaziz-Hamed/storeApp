import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:storeapp/models/product_model.dart';
import 'package:storeapp/services/update_product_service.dart';
import 'package:storeapp/widget/custom_button.dart';
import 'package:storeapp/widget/custom_card.dart';
import 'package:storeapp/widget/custom_text_field.dart';

class UpdateProductPage extends StatefulWidget {
  // ignore: non_constant_identifier_names
  static String ID = "update product";

  const UpdateProductPage({super.key});
  // String? productName, description, image, price;

  @override
  State<UpdateProductPage> createState() => _UpdateProductPageState();
}

class _UpdateProductPageState extends State<UpdateProductPage> {
  String? productName, description, image, price;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    ProductModel product =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 218, 216, 216),
          title: const Text(
            "Update The Product ",
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                CustomCard(product: product),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  onChange: (data) {
                    productName = data;
                  },
                  hint: "Product Name",
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  onChange: (data) {
                    description = data;
                  },
                  hint: "Description",
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  inputtype: TextInputType.number,
                  onChange: (data) {
                    price = data;
                  },
                  hint: "Price",
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  onChange: (data) {
                    image = data;
                  },
                  hint: "Image",
                ),
                const SizedBox(
                  height: 40,
                ),
                CustomButton(
                  size: 25,
                  bgcolor: const Color.fromARGB(255, 61, 187, 245),
                  onTap: () async {
                    isLoading = true;
                    setState(() {});
                    await updateProduct(product);
                    try {} catch (e) {
                      // ignore: avoid_print
                      print(e);
                    }
                    isLoading = false;
                    setState(() {});
                    Navigator.pop(context);
                  },
                  text: "Update",
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> updateProduct(ProductModel product) async {
    await UpdateProductService().updateProduct(
        id: product.id.toString(),
        title: productName == null ? product.title : productName!,
        price: price == null ? product.price.toString() : price!,
        desc: description == null ? product.description : description!,
        image: image == null ? product.image : image!,
        category: product.category);
  }
}
