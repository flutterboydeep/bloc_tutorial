part of 'auth_bloc.dart';

sealed class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthFailure extends AuthState {
  final error;
  AuthFailure(this.error);
}

class AuthSuccess extends AuthState {
  final String uid;
  AuthSuccess({required this.uid});
}
