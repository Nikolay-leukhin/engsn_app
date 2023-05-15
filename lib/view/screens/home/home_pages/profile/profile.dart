import 'package:engsn_corected/view/widgets/default_button.dart';
import 'package:engsn_corected/view/widgets/default_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../logic/home/profile/profile_bloc.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  void initState(){
    context.read<ProfileBloc>().add(ShowProfile());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown,
      body: Container(
        child: BlocBuilder<ProfileBloc, ProfileState>(
          builder: (context, state) {
            if (state is ProfileLoading){
              return const Center(child: CircularProgressIndicator(),);
            }else if (state is ProfileLoaded){
              return ListView(
                children: [
                  Text("PROFILE"),
                  Text("Name: ${state.name}"),
                  Text("Email: ${state.email}"),
                  Text("Password ${state.password}"),
                  Text("Current english level: ${state.englishLevel}"),

                  DefaultElevatedButton(
                      title: "вы ход", onPressed: () {
                        Navigator.of(context).pop();
                        Navigator.of(context).pushNamed('/login');
                      }
                  )
                ],
              );
            }else{
              return const Center(child: Text("Someting went wrong"));
            }
          },
        ),
      ),
    );
  }
}
