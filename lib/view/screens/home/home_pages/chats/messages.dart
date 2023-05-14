import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../logic/home/messages/messages_bloc.dart';
import 'messages_item.dart';

class MessagesList extends StatefulWidget {
  final int id;
  final String title;
  const MessagesList({Key? key, required this.title, required this.id}) : super(key: key);

  @override
  State<MessagesList> createState() => _MessagesListState();
}

class _MessagesListState extends State<MessagesList> {

  void initState(){
    context.read<MessagesBloc>().add(LoadMessagesEvent(widget.id));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent,
      appBar: AppBar(
        title: Text('Chat: ${widget.title}'),
      ),
      body: BlocBuilder<MessagesBloc, MessagesState>(builder: (context, state) {
        if (state is MessagesLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is MessagesLoadedEmpty) {
          return const Center(
            child: Text("У тебя пока не сообщений в чате"),
          );
        } else if (state is MessagesLoaded) {
          return ListView.separated(
              itemBuilder: (context, index) {
                return MessagesItem(message: state.messages[index],);
              },
              separatorBuilder: (context, index) => const SizedBox(
                    height: 10,
                  ),
              itemCount: state.messages.length);
        } else {
          return const Center(
            child: Text("Something went wrong"),
          );
        }
      }),
    );
  }
}
