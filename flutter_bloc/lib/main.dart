import 'package:flutter/material.dart';
import 'package:flutter_bloc/bloc/login_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:example_flutter_bloc/repository/login_repository.dart';
import 'layout/homepage.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MultiRepositoryProvider(
        providers: [
          RepositoryProvider<LoginRepository>(
            create: (context) => LoginRepository(),
          ),
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider<LoginBloc>(
              create: (context) => LoginBloc(
                loginRepository: context.read<LoginRepository>(),
              ),
            ),
          ],
          child: HomePage(),
        ),
      ),
    );
  }
}
