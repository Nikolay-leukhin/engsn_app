import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../logic/login/login_bloc.dart';

class ProfileLoadingPopup extends StatefulWidget {
  const ProfileLoadingPopup({Key? key}) : super(key: key);

  @override
  State<ProfileLoadingPopup> createState() => _ProfileLoadingPopupState();
}

class _ProfileLoadingPopupState extends State<ProfileLoadingPopup> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        elevation: 20,
        content: FractionallySizedBox(
          widthFactor: 0.8,
          heightFactor: 0.3,
          child: BlocBuilder(
              bloc: context.read<LoginBloc>(),
              builder: (context, state)  {
                if (state is LoginLoading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is LoginLoaded) {
                  return const Center(
                    child: Icon(
                      Icons.check_circle,
                      size: 80,
                      color: Colors.green,
                    ),
                  );
                } else {
                  return Center(
                    child: Text("Somethingwent wrong"),
                  );
                }
              }),
        ));
  }
}
