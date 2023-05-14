import 'package:engsn_corected/view/router/app_router.dart';
import 'package:engsn_corected/view/screens/home/home_pages/home_pages.dart';
import 'package:engsn_corected/view/widgets/default_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../logic/app/app_bloc.dart';
import 'home_pages/cards/cards_list.dart';
import 'home_pages/chats/chat_list.dart';
import 'home_pages/profile/profile.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _pageIndex = 1;

  void _onChanged(int index){
    setState(() {
      _pageIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('HOME PAGE'),
        ),
        body: pages[_pageIndex],
        bottomNavigationBar: BottomNavigationBar(
          onTap: _onChanged,
          currentIndex: _pageIndex,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.ac_unit_outlined), label: "1"),
            BottomNavigationBarItem(icon: Icon(Icons.assistant_direction_outlined),label: "2"),
            BottomNavigationBarItem(icon: Icon(Icons.policy_outlined), label: "3"),
          ],
        ),
    );
  }
}
