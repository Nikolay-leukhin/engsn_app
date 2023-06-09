import 'package:engsn_corected/data/repository/user_repository.dart';
import 'package:engsn_corected/view/utils/colors.dart';
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
      backgroundColor: AppColors.sky,
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            height: MediaQuery.of(context).size.height,
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Вход',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),

                      const SizedBox(
                        height: 20,
                      ),
                      DefaultTextField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        hintText: "email",
                        icon: Icons.alternate_email,
                      ),
                      DefaultTextField(
                        controller: _passwordController,
                        keyboardType: TextInputType.name,
                        hintText: "pwd",
                        icon: (Icons.lock),
                        obscureText: true,
                      ),
                      BlocListener<LoginBloc, LoginState>(
                        listener: (context, state) async {
                          if (context.read<LoginBloc>().state is LoginLoaded) {
                            await Future.delayed(Duration(seconds: 1));
                            // ignore: use_build_context_synchronously
                            Navigator.of(context).pop();
                            // ignore: use_build_context_synchronously
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
                      ),

                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Еще нет аккаунта,",
                      style: TextStyle(
                          fontSize: 15,
                          color: AppColors.black
                      ),),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed('/signin');
                      },
                      child:
                      const Text('регистрация',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
