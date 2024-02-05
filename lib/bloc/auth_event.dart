part of 'auth_bloc.dart';

sealed class AuthEvent {}

class AuthLoginRequest extends AuthEvent {
  final Email;
  final Password;
  AuthLoginRequest({required this.Email, required this.Password});
}

class AuthLogOutRequest extends AuthEvent {}
