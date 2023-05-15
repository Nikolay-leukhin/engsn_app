import 'package:engsn_corected/view/screens/home/home_pages/chats/messages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../data/models/session.dart';
import '../../../../../logic/app/app_bloc.dart';
import '../../../../../logic/home/chat/chat_bloc.dart';

class ChatItem extends StatefulWidget {
  final Session session;
  const ChatItem({Key? key, required this.session}) : super(key: key);

  @override
  State<ChatItem> createState() => _ChatItemState();
}

class _ChatItemState extends State<ChatItem> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (BuildContext context) => MessagesList(session: widget.session))
              );
            },
            child: Container(
              constraints: const BoxConstraints(
                minHeight: 91
              ),
              color: Colors.purple,
              child: Column(
                children: [Text('name: ${widget.session.sessionName}'), Text('date: ${widget.session.sessionTimeCreation}')],
              ),
            ),
          ),
        ),
        SizedBox(width: 40,),
        PopupMenuButton(
            itemBuilder: (_) => const <PopupMenuItem<String>>[
                  PopupMenuItem<String>(child: Text('Doge'), value: 'удалить'),
                  PopupMenuItem<String>(child: Text('Lion'), value: 'изменить'),
                ],
            onSelected: (_) {})
      ],
    );
  }
}
