import 'package:engsn_corected/view/screens/home/home_pages/home_pages.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';

import '../../utils/colors.dart';


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
          elevation: 0,
          backgroundColor: AppColors.darkcherry,
          title:
          Center(
            child:
            Text('Engsnp',
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 25
            ),),
          ),
        ),
        body:pages[_pageIndex],
        bottomNavigationBar: FlashyTabBar(
            animationDuration: Duration(milliseconds: 600),
            animationCurve: Curves.linear,
            selectedIndex: _pageIndex,
            iconSize: 25,
            showElevation: false, // use this to remove appBar's elevation
            onItemSelected: _onChanged,
            backgroundColor: AppColors.darkcherry,
            items: [
              FlashyTabBarItem(
                activeColor: AppColors.sky,
                icon: Icon(Icons.person),
                title: Text('Я', style: TextStyle(fontSize: 18),),
              ),
              FlashyTabBarItem(
                activeColor: AppColors.sky,
                icon: Icon(Icons.message_outlined),
                title: Text('Чат', style: TextStyle(fontSize: 18),),
              ),
              FlashyTabBarItem(
                activeColor: AppColors.sky,
                icon: Icon(Icons.card_membership),
                title: Text('Слова', style: TextStyle(fontSize: 18),),
              ),
            ],
          ),
        );
  }
}
