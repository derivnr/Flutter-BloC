import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/bloc/login_event.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<InitLogin>(_initLogin);
    on<ProsesLogin>(_prosesLogin);
    on<ProsesLogout>(_prosesLogout);
  }

  _initLogin(InitLogin event, Emitter emit) async {}
  _prosesLogout(ProsesLogout event, Emitter emit) async {}
  _prosesLogin(ProsesLogin event, Emitter emit) async {}
}

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final String sessionToken;
  LoginSuccess({required this.sessionToken});
}

class LoginFailure extends LoginState {
  final String error;
  LoginFailure({required this.error});
}
