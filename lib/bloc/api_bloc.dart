import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc/models/productModel.dart';
import 'package:http/http.dart' as http;
part 'api_event.dart';
part 'api_state.dart';

class ApiBloc extends Bloc<ApiEvent, ApiState> {
  ApiBloc() : super(ApiInitialState()) {
    on<FatchDataEvent>((event, emit) async {
      try {
        emit(ApiLoadingState());
        final response =
            await http.get(Uri.parse("https://fakestoreapi.com/products"));
        if (response.statusCode == 200) {
          emit(ApiLoadedState(productModelFromJson(response.body)));
        } else {
          throw "Failed to Load product";
        }
      } catch (e) {
        emit(ApiFailureState(Error: "Error : ${e.toString}"));
      }
    });
  }
}
