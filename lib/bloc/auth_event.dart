part of 'auth_bloc.dart';

sealed class AuthEvent {}

class AuthSignInRequest extends AuthEvent {
  final String Email;
  final String Password;
  AuthSignInRequest({
    required this.Email,
    required this.Password,
  });
}

class AuthSignOutRequest extends AuthEvent {}
