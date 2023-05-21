import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:engsn_corected/view/router/app_router.dart';
import 'package:engsn_corected/view/screens/home/home_pages/home_pages.dart';
import 'package:engsn_corected/view/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:google_nav_bar/google_nav_bar.dart';


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
          backgroundColor: Colors.transparent,
          title:
          Center(
            child:
            Text('Engsnp',
            style: Theme.of(context).textTheme.headlineMedium,),
          ),
        ),
        body:pages[_pageIndex],

        bottomNavigationBar: Container(
          color: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12.5),
          child: GNav(
            rippleColor: Colors.blueGrey.shade800,
            hoverColor: Colors.blueGrey.shade700,
            haptic: true,
            tabBorderRadius: 25,
            backgroundColor: Colors.white,
            tabBackgroundColor: AppColors.sky.withOpacity(0.4),
            duration: Duration(milliseconds: 300),
            padding: const EdgeInsets.all(16),
            gap: 8,
            tabs: const [
              GButton(
                icon: Icons.face,
                text: 'Профиль',
                textSize: 10,
              ),
              GButton(
                icon: Icons.mail,
                text: 'Мессенджер',
                textSize: 10,
              ),
              GButton(
                icon: Icons.bookmark,
                text: 'Словарь',
                textSize: 5,
              ),
            ],
            selectedIndex: _pageIndex,
            onTabChange: _onChanged,
          ),
        )
    );
  }
}
