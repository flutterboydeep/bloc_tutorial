import 'package:http/http.dart' as http;
import 'package:learn_bloc/models/productModel.dart';

class ProductRepo {
  Future<List<ProductModel>> getData() async {
    final response =
        await http.get(Uri.parse("https://fakestoreapi.com/products"));
    if (response.statusCode == 200) {
      return productModelFromJson(response.body);
    } else {
      throw "Failed to Load product";
    }
  }
}
