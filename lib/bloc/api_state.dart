part of 'api_bloc.dart';

sealed class ApiState {}

class ApiInitialState extends ApiState {}

class ApiLoadingState extends ApiState {}

class ApiFailureState extends ApiState {
  final String Error;
  ApiFailureState({
    required this.Error,
  });
}

class ApiLoadedState extends ApiState {
  List<ProductModel> productModel;

  ApiLoadedState(this.productModel);
}
