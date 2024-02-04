import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthSignInRequest>(_onAuthSingInRequest);
    on<AuthSignOutRequest>(_onAuthSignOUtRequest);
  }

  @override
  void onChange(Change<AuthState> change) {
    super.onChange(change);
    log("AuthBloc - $change");
  }

  @override
  void onTransition(Transition<AuthEvent, AuthState> transition) {
    super.onTransition(transition);
    print("OnTransition= $transition");
  }

  void _onAuthSingInRequest(event, emit) async {
    emit(AuthLoading());
    try {
      final email = event.Email;
      final passsword = event.Password;

      await Future.delayed(Duration(seconds: 1), () {
        return emit(AuthSuccess(uid: '$email-$passsword'));
      });

      if (passsword.length < 6) {
        return emit(AuthFailure("Password cannot be less than 6 charactes"));
      }
    } catch (e) {
      emit(AuthFailure("Error ocured: $e"));
    }
  }

  void _onAuthSignOUtRequest(event, emit) async {
    try {
      await Future.delayed(Duration(seconds: 1), () {
        return emit(AuthInitial());
      });
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }
}
