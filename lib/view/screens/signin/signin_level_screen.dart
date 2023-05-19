import 'package:flutter/material.dart';

import '../../widgets/loading_indicator.dart';

List<dynamic> englishLevels = [
  {
    'level': 'A1',
    'color': Colors.red,
    'level_name': 'тупик',
  },
  {
    'level': 'A2',
    'color': Colors.orange,
    'level_name': 'раслабон',
  },
  {
    'level': 'B1',
    'color': Colors.yellow,
    'level_name': 'школьник',
  },
  {
    'level': 'B2',
    'color': Colors.green,
    'level_name': 'боец',
  },
  {
    'level': 'C1',
    'color': Colors.lightBlue,
    'level_name': 'полковник',
  },
  {
    'level': 'C2',
    'color': Colors.blue,
    'level_name': 'генерал',
  },
];

class SigninLevelScreen extends StatefulWidget {
  const SigninLevelScreen({Key? key}) : super(key: key);

  @override
  State<SigninLevelScreen> createState() => _SigninLevelScreenState();
}

class _SigninLevelScreenState extends State<SigninLevelScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          EnglishLevelCard(
            level: englishLevels[0]['level'],
            color: englishLevels[0]['color'],
            levelName: englishLevels[0]['level_name'],
          ),
          EnglishLevelCard(
            level: englishLevels[1]['level'],
            color: englishLevels[1]['color'],
            levelName: englishLevels[1]['level_name'],
          ),
          EnglishLevelCard(
            level: englishLevels[2]['level'],
            color: englishLevels[2]['color'],
            levelName: englishLevels[2]['level_name'],
          ),
          EnglishLevelCard(
            level: englishLevels[3]['level'],
            color: englishLevels[3]['color'],
            levelName: englishLevels[3]['level_name'],
          ),
          EnglishLevelCard(
            level: englishLevels[4]['level'],
            color: englishLevels[4]['color'],
            levelName: englishLevels[4]['level_name'],
          ),
          EnglishLevelCard(
            level: englishLevels[5]['level'],
            color: englishLevels[5]['color'],
            levelName: englishLevels[5]['level_name'],
          ),
        ],
      ),
    );
  }
}

class EnglishLevelCard extends StatefulWidget {
  const EnglishLevelCard({Key? key, required this.level, required this.levelName, required this.color}) : super(key: key);

  final String level;
  final String levelName;
  final Color color;

  @override
  State<EnglishLevelCard> createState() => _EnglishLevelCardState();
}

class _EnglishLevelCardState extends State<EnglishLevelCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.grey, borderRadius: BorderRadius.all(Radius.circular(50))),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(color: widget.color, borderRadius: BorderRadius.all(Radius.circular(50))),
            child: Text(
              "${widget.level}",
              style: TextStyle(color: Colors.white, fontSize: 40),
            ),
          ),
          SizedBox(width: 20),
          Text(
            "${widget.levelName}",
            style: TextStyle(color: Colors.white),
          )
        ],
      ),
    );
  }
}
