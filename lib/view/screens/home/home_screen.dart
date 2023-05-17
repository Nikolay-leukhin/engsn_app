import 'package:engsn_corected/view/router/app_router.dart';
import 'package:engsn_corected/view/screens/home/home_pages/home_pages.dart';
import 'package:engsn_corected/view/utils/colors.dart';
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
          backgroundColor: AppColors.blue,
          title: const Text('бургер'),
        ),
        body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/back.png'),
                repeat: ImageRepeat.repeat,
              )
          ),
          child: pages[_pageIndex],
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: AppColors.blue,
          selectedItemColor: AppColors.dark,
          unselectedItemColor: AppColors.sky,
          onTap: _onChanged,
          currentIndex: _pageIndex,
          items: const  [
            BottomNavigationBarItem(icon: Icon(Icons.face), label: "профиль"),
            BottomNavigationBarItem(icon: Icon(Icons.mail),label: "чат"),
            BottomNavigationBarItem(icon: Icon(Icons.bookmark), label: "лексика"),
          ],
        ),
    );
  }
}
