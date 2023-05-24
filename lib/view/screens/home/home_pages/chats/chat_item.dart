import 'package:engsn_corected/view/screens/home/home_pages/chats/messages.dart';
import 'package:engsn_corected/view/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

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
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${widget.session.sessionName}',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  Text(DateFormat.yMMMEd().format(widget.session.sessionTimeCreation),style: GoogleFonts.openSans(
                    color:AppColors.purple,
                    fontWeight: FontWeight.w300,
                    fontSize: 15
                  )),
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
            color: Colors.white,
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
