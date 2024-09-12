import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState()) {
    // on<LoginEvent>((event, emit) {
    //   // TODO: implement event handler
    // });
    on<EmailChanged>(_onEmailChanged);
    on<PasswordChanged>(_onPasswordChanged);
    on<LoginApi>(_onLoginApi);
  }

  void _onEmailChanged(EmailChanged event, Emitter<LoginState> emit) {
    emit(state.copyWith(email: event.eamil));
  }

  void _onPasswordChanged(PasswordChanged event, Emitter<LoginState> emit) {
    emit(state.copyWith(password: event.password));
  }

  void _onLoginApi(LoginApi event, Emitter<LoginState> emit) async {
    emit(state.copyWith(
      loginStatus: LoginStatus.loading,
    ));

    Map data = {'email': state.email, 'password': state.password};

    try {
      final response = await http.post(
        Uri.parse('https://reqres.in/api/login'),
        body: data,
      );
      var data1 = jsonDecode(response.body);

      if (response.statusCode == 200) {
        emit(state.copyWith(
          loginStatus: LoginStatus.error,
          message: "Login Successful",
        ));
        // Handle successful response
      } else {
        emit(state.copyWith(
          loginStatus: LoginStatus.error,
          message: data1['error'],
        ));
      }
    } catch (e) {
      emit(state.copyWith(
        message: e.toString(),
      ));
    }
  }
}
