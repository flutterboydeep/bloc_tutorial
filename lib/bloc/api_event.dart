part of 'api_bloc.dart';

sealed class ApiEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FatchDataEvent extends ApiEvent {}
