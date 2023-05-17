import 'package:engsn_corected/view/screens/home/home_pages/chats/messages.dart';
import 'package:engsn_corected/view/utils/colors.dart';
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
              Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => MessagesList(session: widget.session)));
            },
            child: Container(
              padding: EdgeInsets.all(10),
              constraints: const BoxConstraints(minHeight: 80),
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.blue, width: 2),
                borderRadius: BorderRadius.all(Radius.circular(15)),
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    AppColors.purple.withAlpha(50),
                    AppColors.sky,
                  ],
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'name: ${widget.session.sessionName}',
                    style: TextStyle(color: AppColors.dark),
                  ),
                  Text('date: ${widget.session.sessionTimeCreation}', style: TextStyle(color: AppColors.dark)),
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          width: 20,
        ),
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(color: Colors.transparent, shape: BoxShape.circle, border: Border.all(color: AppColors.blue, width: 2)),
          child: PopupMenuButton(
              itemBuilder: (_) => const <PopupMenuItem<String>>[
                    PopupMenuItem<String>(child: Text('Doge'), value: 'удалить' ),
                    PopupMenuItem<String>(child: Text('Lion'), value: 'изменить'),
                  ],
              onSelected: (_) {}),
        )
      ],
    );
  }
}
