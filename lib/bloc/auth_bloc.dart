import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthLoginRequest>(_onAuthLogInRequest);
    on<AuthLogOutRequest>(_onAuthLogOutRequest);
  }


  void _onAuthLogInRequest
    (event, emit) async {
      final mail = event.Email;
      final password = event.Password;
      emit(AuthLoading());

      try {
        if (password.length < 6) {
          return emit(AuthFailure("Password can not be less then 6 character"));
        }
        if (mail.isEmpty) {
          return emit(AuthFailure("E-mail can not be empty"));
        }
        await Future.delayed(Duration(seconds: 2), () {
          return emit(AuthSucess(userOutput: "$mail-$password"));
        });
      } catch (e) {
        return emit(AuthFailure("Error: $e"));
      }
    }


    
    void _onAuthLogOutRequest(event, state) async {
      emit(AuthLoading());
      try {
        await Future.delayed(Duration(seconds: 3), () {
          return emit(AuthInitial());
        });
      } catch (e) {
        return emit(AuthFailure("Error : $e"));
      }
    }
  }
  
}
