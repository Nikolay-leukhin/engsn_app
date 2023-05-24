import 'dart:developer';

import 'package:engsn_corected/logic/signin/signin_bloc.dart';
import 'package:engsn_corected/view/screens/signin/signin_level_screen.dart';
import 'package:engsn_corected/view/utils/colors.dart';
import 'package:engsn_corected/view/widgets/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/default_button.dart';
import '../../widgets/default_text_field.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({Key? key}) : super(key: key);

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _repeatedController = TextEditingController();

  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.sky,
        appBar: AppBar(
          iconTheme: IconThemeData(color: AppColors.dark),
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: BlocConsumer<SigninBloc, SigninState>(
          bloc: context.read<SigninBloc>(),
          listener: (context, state) {
            log("current state $state");
            if (state is SigninDifferentPassword) {
              const snackbar = SnackBar(content: Text("Повторите пароль нормально!"));
              ScaffoldMessenger.of(context).showSnackBar(snackbar);
            } else if (state is SigninShortPassword) {
              const snackbar = SnackBar(content: Text("Какой то короткий!"));
              ScaffoldMessenger.of(context).showSnackBar(snackbar);
            }else if (state is SigninIncorrectEmail){
              const snackbar = SnackBar(content: Text("Почту норм пж!"));
              ScaffoldMessenger.of(context).showSnackBar(snackbar);
            }else if (state is SigninNameShort){
              const snackbar = SnackBar(content: Text("Подлиннее имя!"));
              ScaffoldMessenger.of(context).showSnackBar(snackbar);
            }else{
              print('succes filled');
              Navigator.of(context).pushNamed("/signin/level");
            }
          },
          builder: (context, state) => SingleChildScrollView(
            child: Container(
                height: MediaQuery.of(context).size.height - kTextTabBarHeight * 2,
                padding: const EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Регистрация', style: Theme.of(context).textTheme.headlineMedium),
                    const SizedBox(height: 20),
                    Container(
                      decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          DefaultTextField(
                            controller: _nameController,
                            keyboardType: TextInputType.text,
                            hintText: "имя",
                            icon: Icons.person,
                          ),
                          DefaultTextField(
                            controller: _emailController,
                            keyboardType: TextInputType.emailAddress,
                            hintText: "почта",
                            icon: Icons.alternate_email,
                          ),
                          DefaultTextField(
                            controller: _passwordController,
                            keyboardType: TextInputType.emailAddress,
                            hintText: "пароль",
                            icon: Icons.lock,
                          ),
                          DefaultTextField(
                            controller: _repeatedController,
                            keyboardType: TextInputType.name,
                            hintText: "повторите пароль",
                            icon: (Icons.lock),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    DefaultElevatedButton(
                      title: 'ПРОДОЛЖИТЬ',
                      onPressed: () {
                        context.read<SigninBloc>().add(SigninMainButtonPressed(
                              nickname: _nameController.text,
                              email: _emailController.text,
                              password: _passwordController.text,
                              repeatedPassword: _repeatedController.text,
                            ));

                        // Navigator.of(context).push(MaterialPageRoute(builder: (context) => SigninLevelScreen() ));
                      },
                    ),
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
