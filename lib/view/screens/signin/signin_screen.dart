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


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('top name'),
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
              DefaultElevatedButton(
                title: 'LOGIN',
                onPressed: () {
                  print('hi');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}


