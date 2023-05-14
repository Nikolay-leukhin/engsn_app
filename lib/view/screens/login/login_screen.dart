

import 'package:engsn_corected/data/repository/user_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../logic/app/app_bloc.dart';
import '../../widgets/default_button.dart';
import '../../widgets/default_text_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _englishLevelController = TextEditingController();
  TextEditingController _nicknameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Column(
        children: [
          DefaultTextField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              hintText: "email",
          ),
          DefaultTextField(
              controller: _passwordController,
              keyboardType: TextInputType.name,
              hintText: "pwd",
          ),
          DefaultElevatedButton(title: 'LOGIN', onPressed: () {
            String userEmail = _emailController.text;
            String userPassword = _passwordController.text;

            context.read<UserRepository>().email = userEmail;
            context.read<UserRepository>().password = userPassword;

            context.read<AppBloc>().add(LoginButtonPressed());
          },
          )
        ],
      ),
    );
  }
}
