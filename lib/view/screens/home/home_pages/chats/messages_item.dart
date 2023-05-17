import 'package:flutter/material.dart';

import '../../../../../data/models/message.dart';
import '../../../../utils/colors.dart';

class MessagesItem extends StatefulWidget {
  final Message message;
  const MessagesItem({Key? key, required this.message}) : super(key: key);

  @override
  State<MessagesItem> createState() => _MessagesItemState();
}

class _MessagesItemState extends State<MessagesItem> {
  @override
  Widget build(BuildContext context) {
    return widget.message.sender == 'user' ? _userMessage() : _botMessage();
  }

  Widget _userMessage(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.6
          ),
          alignment: Alignment.centerRight,
          decoration: BoxDecoration(
              color: AppColors.purple,
              borderRadius: BorderRadius.all(Radius.circular(15)),
              border: Border.all(color: Colors.white70, width: 3)),
          padding: EdgeInsets.all(15),
          child: Column(

            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text('${widget.message.messageText},', textAlign: TextAlign.end)
            ],
          ),
        ),
        SizedBox(width: 10,),
        Icon(Icons.face_2_outlined, size: 30,)
      ],
    );
  }


  Widget _botMessage(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(Icons.terminal_rounded),
        Container(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.6
          ),
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: AppColors.blue,
              borderRadius: BorderRadius.all(Radius.circular(15)),
              border: Border.all(color: Colors.white70, width: 3)),
          padding: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('${widget.message.messageText}', textAlign: TextAlign.start,)
            ],
          ),
        ),

      ],
    );
  }
}
