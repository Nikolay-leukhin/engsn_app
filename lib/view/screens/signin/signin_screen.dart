import 'package:engsn_corected/view/screens/signin/signin_level_screen.dart';
import 'package:engsn_corected/view/utils/colors.dart';
import 'package:flutter/material.dart';

import '../../widgets/default_button.dart';
import '../../widgets/default_text_field.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({Key? key}) : super(key: key);

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _repeatedController = TextEditingController();

  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: AppColors.dark),
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: SingleChildScrollView(
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
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => SigninLevelScreen() ));
                    },
                  ),
                ],
              )),
        ),
      ),
    );
  }
}

