import 'package:flutter/material.dart';

import '../../../../../data/models/message.dart';

class MessagesItem extends StatefulWidget {
  final Message message;
  const MessagesItem({Key? key, required this.message}) : super(key: key);

  @override
  State<MessagesItem> createState() => _MessagesItemState();
}

class _MessagesItemState extends State<MessagesItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: widget.message.sender == 'user' ? Colors.blue : Colors.black,
      padding: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: widget.message.sender == 'user' ? CrossAxisAlignment.end: CrossAxisAlignment.start,
        children: [
        Text('${widget.message.sender}'),
        Text('${widget.message.messageText}')
      ],),
    );
  }
}
