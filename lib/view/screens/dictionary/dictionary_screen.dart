import 'package:engsn_corected/view/screens/dictionary/dictionary_current_themes_list.dart';
import 'package:engsn_corected/view/screens/dictionary/theme_small_card.dart';
import 'package:engsn_corected/view/utils/colors.dart';
import 'package:flutter/material.dart';

class DictionaryScreen extends StatefulWidget {
  const DictionaryScreen({super.key});

  @override
  State<DictionaryScreen> createState() => _DictionaryScreenState();
}

class _DictionaryScreenState extends State<DictionaryScreen> with TickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 2, vsync: this);

    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.grey
            ),
            child: TabBar(
              indicator: BoxDecoration(
                color: AppColors.purple,
                borderRadius: BorderRadius.circular(15),
              ),
              controller: _tabController,
              isScrollable: true,
              tabs: const [
                Tab(child: Text("In process..."),),
                Tab(child: Text("Completed"),)
              ],
            ),  
          ),
          SizedBox(height: 20,),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                DictionaryThemesList(),
                Text('NONONON')
              ],
            )
          )
          ]
        ,)
        ),
    );
  }
}
