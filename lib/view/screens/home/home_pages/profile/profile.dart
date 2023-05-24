import 'package:engsn_corected/logic/login/login_bloc.dart';
import 'package:engsn_corected/view/utils/colors.dart';
import 'package:engsn_corected/view/widgets/default_button.dart';
import 'package:engsn_corected/view/widgets/default_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

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
      child: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          if (state is ProfileLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ProfileLoaded) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: AppColors.darkcherry,
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50), bottomRight: Radius.circular(50)),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.blue.withOpacity(0.5),
                          spreadRadius: 3,
                          blurRadius: 7,
                          offset: Offset(0, 1), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          child: Image.asset("assets/ava.png"),
                          radius: 50,
                          backgroundColor: AppColors.blue,
                        ),
                        Text(state.name, style: GoogleFonts.openSans(color: AppColors.purple, fontSize: 30, fontWeight: FontWeight.w800)),
                        Text(state.email, style: GoogleFonts.openSans(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w400)),
                        const SizedBox(
                          height: 18,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(border: Border.all(color: AppColors.purple, width: 2), borderRadius: BorderRadius.all(Radius.circular(25))),
                          child: ListTile(
                            leading: Icon(Icons.token, color: AppColors.purple, size: 50),
                            title: Text(state.englishLevel, style: Theme.of(context).textTheme.bodySmall),
                            subtitle: Text(state.englishLevel, style: Theme.of(context).textTheme.bodySmall),
                            trailing: Icon(Icons.settings, color: AppColors.purple, size: 30),
                          ),
                        ),
                      ],
                    )),
                const SizedBox(
                  height: 10,
                ),
                DefaultElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    context.read<LoginBloc>().add(LogoutButtonPressed());
                    Navigator.of(context).pushNamed('/login');
                  },
                  title: "Выход",
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
