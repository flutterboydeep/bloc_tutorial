import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc/models/productModel.dart';

import 'package:learn_bloc/data/repository/product_repo.dart';

part 'api_event.dart';
part 'api_state.dart';

class ApiBloc extends Bloc<ApiEvent, ApiState> {
  final ProductRepo productRepo;
  ApiBloc(this.productRepo) : super(ApiInitialState()) {
    on<FatchDataEvent>((event, emit) async {
      emit(ApiLoadingState());
      try {
        final productt = await productRepo.getData();

        emit(ApiLoadedState(productt));
      } catch (e) {
        emit(ApiFailureState(Error: "Error : ${e.toString}"));
      }
    });
  }
}
