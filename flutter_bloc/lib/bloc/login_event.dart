import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
sealed class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class InitLogin extends LoginEvent {
  const InitLogin();
  @override
  List<Object> get props => [];
}

class ProsesLogin extends LoginEvent {
  final String username;
  final String password;

  const ProsesLogin({this.username = "", this.password = ""});
  @override
  List<Object> get props => [username, password];
}
