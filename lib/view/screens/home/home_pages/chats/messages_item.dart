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
    return FractionallySizedBox(
      alignment: widget.message.sender == "user" ? Alignment.centerRight : Alignment.centerLeft,
      widthFactor: 0.8,
      child: Container(
        width: 0.2,
        decoration: BoxDecoration(
            color: widget.message.sender == 'user' ? AppColors.purple : AppColors.blue,
            borderRadius: BorderRadius.all(Radius.circular(15)),
            border: Border.all(color: Colors.white70, width: 3)),
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: widget.message.sender == 'user' ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            Text('${widget.message.messageText},', textAlign: widget.message.sender == 'user' ? TextAlign.end : TextAlign.start,)
          ],
        ),
      ),
    );
  }
}
