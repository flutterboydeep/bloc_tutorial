import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc/models/productModel.dart';

import 'package:learn_bloc/repository/product_repo.dart';

part 'api_event.dart';
part 'api_state.dart';

class ApiBloc extends Bloc<ApiEvent, ApiState> {
  ProductRepo productRepo;
  ApiBloc(this.productRepo) : super(ApiInitialState()) {
    on<FatchDataEvent>((event, emit) async {
      try {
        emit(ApiLoadingState());
        final repoData = await productRepo.getData();

        emit(ApiLoadedState(repoData));
      } catch (e) {
        emit(ApiFailureState(Error: "Error : ${e.toString}"));
      }
    });
  }
}
