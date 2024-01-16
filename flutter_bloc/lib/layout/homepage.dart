import 'package:flutter/material.dart';
import 'package:flutter_bloc/bloc/login_bloc.dart';
import 'package:flutter_bloc/bloc/login_event.dart';
import 'package:flutter_bloc/bloc/login_state.dart';
import 'package:flutter_bloc/repository/login_repository.dart';

import 'login.dart';
import 'loading.dart';
import 'dashboard.dart';
import 'error_message.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        if (state is LoginInitial) {
          return LoginForm();
        } else if (state is LoginLoading) {
          return LoadingIndicator();
        } else if (state is LoginSuccess) {
          return WelcomeScree(sessionToken: state.sessionToken);
        } else if (state is LoginFailure) {
          return ErrorMessage(message: state.error);
        } else {
          return Container();
        }
      },
    );
  }
}
