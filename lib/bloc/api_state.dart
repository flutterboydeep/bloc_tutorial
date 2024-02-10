// ignore_for_file: must_be_immutable
part of 'api_bloc.dart';

sealed class ApiState extends Equatable {
  List<Object?> get props => [];
}

class ApiInitialState extends ApiState {}

class ApiLoadingState extends ApiState {}

class ApiFailureState extends ApiState {
  final String Error;
  ApiFailureState({required this.Error});
  List<Object?> get props => [Error];
}

class ApiLoadedState extends ApiState {
  List<ProductModel> productModel;

  ApiLoadedState(this.productModel);
  List<Object?> get props => [productModel];
}
