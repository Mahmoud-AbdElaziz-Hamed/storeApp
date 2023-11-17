import 'package:storeapp/helper/api.dart';

class GetAllCategoresService {
  Future<List<dynamic>> getAllCategores() async {
    List<dynamic> data =
        await Api().get(url: "https://fakestoreapi.com/products/categories");
    return data;
  }
}
