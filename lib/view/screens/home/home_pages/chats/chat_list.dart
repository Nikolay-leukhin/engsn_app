import 'package:engsn_corected/view/screens/home/home_pages/chats/chat_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../data/repository/user_repository.dart';
import '../../../../../logic/app/app_bloc.dart';
import '../../../../../logic/home/chat/chat_bloc.dart';
import '../../../../utils/colors.dart';
import 'chat_add_popup.dart';

class ChatList extends StatefulWidget {
  const ChatList({Key? key}) : super(key: key);

  @override
  State<ChatList> createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {
  TextEditingController _popupController = TextEditingController();

  void initState() {
    context.read<ChatBloc>().add(LoadSessionsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: context.read<ChatBloc>(),
      child: Scaffold(
        backgroundColor: AppColors.cherry,
        body: RefreshIndicator(
          onRefresh: () async {
            context.read<ChatBloc>().add(LoadSessionsEvent());
          },
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: BlocBuilder<ChatBloc, ChatState>(
              builder: (context, state) {
                if (state is LoadingChatList) {
                  return Center(child: CircularProgressIndicator());
                }
                if (state is LoadedChatList) {
                  return Container(
                    decoration: BoxDecoration(
                    ),
                    child: ListView.separated(
                      itemCount: state.sessions.length,
                      itemBuilder: (context, index) {
                        return ChatItem(session: state.sessions[state.sessions.length - index - 1],);
                      },
                      separatorBuilder: (BuildContext context, int index) => SizedBox(
                        height: 20,
                      ),
                    ),
                  );
                }
                if (state is LoadedChatListEmpty) {
                  return Center(
                    child: Text("You have no chats"),
                  );
                }
                return Center(
                  child: Text("something went wrong"),
                );
              },
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            print("Sesison adding started");
            showDialog(
                context: context,
                builder: (context) => ChatAddSessionPopup(
                      controller: _popupController,
                      buttonAction: () {},
                    ));
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
