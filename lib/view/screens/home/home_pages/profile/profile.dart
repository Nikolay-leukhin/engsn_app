import 'package:engsn_corected/view/utils/colors.dart';
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

  void initState() {
    context.read<ProfileBloc>().add(ShowProfile());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          if (state is ProfileLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ProfileLoaded) {
            return ListView(
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      Navigator.of(context).pushNamed('/login');
                    },
                    icon: const Icon(Icons.arrow_circle_left_outlined, size: 40, color: Colors.blueAccent),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(shape: BoxShape.circle, color: AppColors.cherry),
                  child: Icon(
                    Icons.savings_outlined,
                    size: 100,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(color: AppColors.blue, borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Name: ${state.name}"),
                        const SizedBox(
                          height: 10,
                        ),
                        Text("Email: ${state.email}"),
                        const SizedBox(
                          height: 10,
                        ),
                        Text("Password ${state.password}"),
                        const SizedBox(
                          height: 10,
                        ),
                        Text("Current english level: ${state.englishLevel}"),
                      ],
                    )),
                const SizedBox(
                  height: 10,
                ),
              ],
            );
          } else {
            return const Center(child: Text("Someting went wrong"));
          }
        },
      ),
    );
  }
}
