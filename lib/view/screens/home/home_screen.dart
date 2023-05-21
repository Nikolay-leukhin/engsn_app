import 'package:engsn_corected/view/router/app_router.dart';
import 'package:engsn_corected/view/screens/home/home_pages/home_pages.dart';
import 'package:engsn_corected/view/utils/colors.dart';
import 'package:flutter/material.dart';


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
          title: const Text('бургер'),
        ),
        body:pages[_pageIndex],

        bottomNavigationBar: BottomNavigationBar(
          elevation: 0,
          backgroundColor: AppColors.sky,
          selectedItemColor: AppColors.dark,
          unselectedItemColor: Colors.grey.withOpacity(0.9),
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
