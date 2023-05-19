import 'dart:ui';

import 'package:engsn_corected/logic/home/chat/chat_bloc.dart';
import 'package:engsn_corected/view/widgets/default_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../utils/colors.dart';

class ChatAddSessionPopup extends StatefulWidget {
  final TextEditingController controller;
  final Function buttonAction;

  const ChatAddSessionPopup({Key? key, required this.controller, required this.buttonAction}) : super(key: key);

  @override
  State<ChatAddSessionPopup> createState() => _ChatAddSessionPopupState();
}

class _ChatAddSessionPopupState extends State<ChatAddSessionPopup> {
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
        title: Text("О чем бы вы хотели бы поговорить?"),
        content: TextField(
          autofocus: true,
          controller: widget.controller,
          decoration: InputDecoration(
              hintText: "ананааасы=)"
          ),
        ),
        actions: [
          DefaultElevatedButton(title: "бом", onPressed: () {
            context.read<ChatBloc>().add(RegisterSessionEvent(sessionName: widget.controller.text));
            context.read<ChatBloc>().add(LoadSessionsEvent());
            widget.controller.clear();
            FocusScope.of(context).unfocus();
            Navigator.of(context).pop();
          })
        ],
      ),
    );
  }
}
