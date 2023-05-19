import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../logic/login/login_bloc.dart';
import '../../utils/colors.dart';
import '../../widgets/loading_indicator.dart';

class ProfileLoadingPopup extends StatefulWidget {
  const ProfileLoadingPopup({Key? key}) : super(key: key);

  @override
  State<ProfileLoadingPopup> createState() => _ProfileLoadingPopupState();
}

class _ProfileLoadingPopupState extends State<ProfileLoadingPopup> {
  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(
        sigmaX: 5.0,
        sigmaY: 5.0
      ),
      child: AlertDialog(
          backgroundColor: AppColors.sky,
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
          elevation: 20,
          content: FractionallySizedBox(
            widthFactor: 0.8,
            heightFactor: 0.3,
            child: BlocBuilder(
                bloc: context.read<LoginBloc>(),
                builder: (context, state)  {
                  if (state is LoginLoading) {
                    return Center(
                      child: LoadingIndicator(),
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
                    return const Center(
                      child: Text("Somethingwent wrong"),
                    );
                  }
                }),
          )),
    );
  }
}
