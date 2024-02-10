import 'dart:convert';

import 'package:learn_bloc/data/data_provider/api_data_provider.dart';
import 'package:learn_bloc/models/productModel.dart';

class ProductRepo {
  final ApiDataProvider apiDataProvider;
  ProductRepo(
    this.apiDataProvider,
  );

  Future<List<ProductModel>> getData() async {
    try {
      String FakeApiData = await apiDataProvider.getDataa();
      final DecodeData = jsonDecode(FakeApiData);

      return List<ProductModel>.from(
        DecodeData.map((x) => ProductModel.fromJson(x)),
      );
    } catch (e) {
      throw e.toString();
    }
  }
}
