import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../../../data/models/message.dart';
import '../../../../utils/colors.dart';
import '../../../../widgets/loading_indicator.dart';

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
      margin: EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
      child: Align(
        alignment: widget.message.sender == "user"  ? Alignment.centerRight : Alignment.centerLeft,
        child: Container(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.7,
          ),
          padding: EdgeInsets.all(12.0),
          decoration: BoxDecoration(
            color: widget.message.sender == "user" ? Colors.blue : Colors.grey,
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: widget.message.sender == "loading" ?
          LoadingAnimationWidget.staggeredDotsWave(
            color: Colors.white,
            size: 30,
          ) :
          Text(
            widget.message.messageText,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.0,
            ),
          ),
        ),
      ),
    );
  }
}
