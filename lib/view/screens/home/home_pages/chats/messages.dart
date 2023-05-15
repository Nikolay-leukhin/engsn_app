import 'dart:async';

import 'package:engsn_corected/view/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../data/models/session.dart';
import '../../../../../logic/home/messages/messages_bloc.dart';
import '../../../../widgets/default_button.dart';
import '../../../../widgets/default_text_field.dart';
import 'messages_item.dart';

class MessagesList extends StatefulWidget {
  final Session session;

  const MessagesList({Key? key, required this.session}) : super(key: key);

  @override
  State<MessagesList> createState() => _MessagesListState();
}

class _MessagesListState extends State<MessagesList> {
  TextEditingController controller = TextEditingController();

  void initState() {
    context.read<MessagesBloc>().add(LoadMessagesEvent(widget.session.id));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cherry,
      appBar: AppBar(
        title: Text('Chat: ${widget.session.sessionName}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          Expanded(
            child: BlocBuilder<MessagesBloc, MessagesState>(builder: (context, state) {
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
                      return MessagesItem(
                        message: state.messages[index],
                      );
                    },
                    separatorBuilder: (context, index) =>
                    const SizedBox(
                      height: 10,
                    ),
                    itemCount: state.messages.length);
              } else {
                return const Center(
                  child: Text("Something went wrong"),
                );
              }
            }),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: DefaultTextField(
                  controller: controller,
                  keyboardType: TextInputType.text,
                  hintText: "Введите сообщение",
                  height: 80,
                ),
              ),
              DefaultElevatedButton(
                width: 100,
                title: "pom->",
                onPressed: () {
                  MessagesBloc bloc = context.read<MessagesBloc>();
                  int userId = bloc.userRepository.userBox.get("user").id;
                  int sessionId = widget.session.id;
                  int order = bloc.state is MessagesLoaded ? (bloc.state as MessagesLoaded).messagesCount + 1 : 1;
                  String text = controller.text;
                  String sender = "user";

                  controller.clear();

                  bloc.add(SendMessageEvent(userId, sessionId, order, text, sender));

                  Future.delayed(Duration.zero).then((_) {
                    bloc.add(LoadMessagesEvent(sessionId));
                  });

                },
              )

            ],
          )
        ]),
      ),
    );
  }
}

