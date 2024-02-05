part of 'auth_bloc.dart';

sealed class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthFailure extends AuthState {
  final String Error;
  AuthFailure(this.Error);
}

class AuthSucess extends AuthState {
  final String userOutput;
  AuthSucess({required this.userOutput});
}
