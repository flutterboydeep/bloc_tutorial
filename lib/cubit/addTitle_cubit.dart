import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc/cubit/models/addTitle_models.dart';

class AddTitle_cubit extends Cubit<List<AddTitle_maodels>> {
  AddTitle_cubit() : super([]);
  void addTitle(String title) {
    final AddDataTitle =
        AddTitle_maodels(titles: title, Created_At: DateTime.now().toString());
    state.add(AddDataTitle);
    print("The run time type of AddData Title is  ${AddDataTitle.runtimeType}");
    emit(state);
  }
}
