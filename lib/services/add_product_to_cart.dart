import 'package:storeapp/models/product_model.dart';

class Cart {
  List<ProductModel> cartProduct = [];
  List<ProductModel> addToCart(product) {
    cartProduct.addAll(product as Iterable<ProductModel>);
    print(cartProduct);
    return cartProduct;
  }
}
