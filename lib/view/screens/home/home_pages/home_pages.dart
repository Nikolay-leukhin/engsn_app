import 'package:engsn_corected/view/screens/home/home_pages/cards/cards_list.dart';
import 'package:engsn_corected/view/screens/home/home_pages/chats/chat_list.dart';
import 'package:engsn_corected/view/screens/home/home_pages/profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../logic/app/app_bloc.dart';

List pages = [
  Profile(),
  ChatList(),
  CardsList()
];
