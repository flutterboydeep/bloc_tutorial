import 'package:learn_bloc/r_model/favModel.dart';

class favRepo {
  Future<List<FavModel>> fatchItem() async {
    await Future.delayed(
      Duration(seconds: 1),
    );
    return List.of(genrateList(15));
  }

  List<FavModel> genrateList(int length) {
    return List.generate(length,
        (index) => FavModel(id: index.toString(), value: "Item $index"));
  }
}
