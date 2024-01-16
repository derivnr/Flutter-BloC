import 'package:flutter/material.dart';
import 'package:flutter_bloc/bloc/login_bloc.dart';
import 'package:flutter_bloc/bloc/login_event.dart';
import 'package:flutter_bloc/bloc/login_state.dart';
import 'package:flutter_bloc/repository/login_repository.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  TextEditingController usernameController = TextEditingController(text: "");
  TextEditingController passwordController = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: usernameController,
              decoration: InputDecoration(
                labelText: 'Username',
              ),
            ),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                context.read<LoginBloc>().add(
                      ProsesLogin(
                        username: usernameController.text,
                        password: passwordController.text,
                      ),
                    );
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
