import 'package:engsn_corected/logic/home/chat/chat_bloc.dart';
import 'package:engsn_corected/view/widgets/default_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    return AlertDialog(
      title: Text("О чем бы вы хотели бы поговорить?"),
      content: TextField(
        autofocus: true,
        controller: widget.controller,
        decoration: InputDecoration(
            hintText: "тык и тап.."
        ),
      ),
      actions: [
        DefaultElevatedButton(title: "бом", onPressed: () {
          context.read<ChatBloc>().add(RegisterSessionEvent(sessionName: widget.controller.text));
          context.read<ChatBloc>().add(LoadSessionsEvent());
          Navigator.of(context).pop();
        })
      ],
    );
  }
}
