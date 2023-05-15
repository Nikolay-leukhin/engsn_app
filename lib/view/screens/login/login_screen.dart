import 'package:engsn_corected/data/repository/user_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../logic/app/app_bloc.dart';
import '../../../logic/login/login_bloc.dart';
import '../../widgets/default_button.dart';
import '../../widgets/default_text_field.dart';
import 'profile_loading_popup.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _emailController = TextEditingController();

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
          BlocListener<LoginBloc, LoginState>(
            listener: (context, state) async {
              if (context.read<LoginBloc>().state is LoginLoaded){
                await Future.delayed(Duration(seconds: 1));
                Navigator.of(context).pop();
                Navigator.of(context).popAndPushNamed("/home");
              }
            },
            child: DefaultElevatedButton(
              title: 'LOGIN',
              onPressed: () {
                String userEmail = _emailController.text;
                String userPassword = _passwordController.text;
                context.read<LoginBloc>().add(LoginButtonPressed(userEmail, userPassword));
                showDialog(context: context, builder: (_) => ProfileLoadingPopup());
              },
            ),
          )
        ],
      ),
    );
  }
}
