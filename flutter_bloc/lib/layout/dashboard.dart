import 'package:flutter/material.dart';
import 'package:flutter_bloc/bloc/login_bloc.dart';
import 'package:flutter_bloc/bloc/login_event.dart';
import 'package:flutter_bloc/bloc/login_state.dart';
import 'package:flutter_bloc/repository/login_repository.dart';

class WelcomeScreen extends StatelessWidget {
  final String sessionToken;

  WelcomeScreen({required this.sessionToken});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Welcome')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome!'),
            SizedBox(height: 16),
            Text('Your session token is: $sessionToken'),
            SizedBox(height: 8),
            Text(sessionToken),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                context.read<LoginBloc>().add(const ProsesLogout());
              },
              child: Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
