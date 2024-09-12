part of 'login_bloc.dart';

sealed class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class EmailChanged extends LoginEvent {
  const EmailChanged({required this.eamil});
  final String eamil;
}

class PasswordChanged extends LoginEvent {
  const PasswordChanged({required this.password});

  final String password;
}

class LoginApi extends LoginEvent {}
