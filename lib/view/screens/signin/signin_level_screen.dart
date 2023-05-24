import 'dart:developer';

import 'package:engsn_corected/app.dart';
import 'package:engsn_corected/logic/signin/signin_bloc.dart';
import 'package:engsn_corected/view/utils/colors.dart';
import 'package:engsn_corected/view/widgets/default_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../logic/app/app_bloc.dart';
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
  String? selectedLevel;

  void updateLevel(String level) {
    setState(() {
      selectedLevel = level;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.sky,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: AppColors.cherry),
      ),
      body: BlocListener<SigninBloc, SigninState>(
        listener: (context, state) {
          if (state is SigninLevelSelected){
            log("succes register");
            Navigator.of(context).pushNamedAndRemoveUntil('/login', (route) => false);
          }else if (state is SigninLevelSelectedLoading){
            final SnackBar snack = SnackBar(content: Text("минуточку регистрация в полном ходу"));
            ScaffoldMessenger.of(context).showSnackBar(snack);
          }
        },
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            Text(
              "Выбери уровень английского",
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 10,
            ),
            EnglishLevelCard(
              level: englishLevels[0]['level'],
              color: englishLevels[0]['color'],
              levelName: englishLevels[0]['level_name'],
              currentState: this,
            ),
            EnglishLevelCard(
              level: englishLevels[1]['level'],
              color: englishLevels[1]['color'],
              levelName: englishLevels[1]['level_name'],
              currentState: this,
            ),
            EnglishLevelCard(
              level: englishLevels[2]['level'],
              color: englishLevels[2]['color'],
              levelName: englishLevels[2]['level_name'],
              currentState: this,
            ),
            EnglishLevelCard(
              level: englishLevels[3]['level'],
              color: englishLevels[3]['color'],
              levelName: englishLevels[3]['level_name'],
              currentState: this,
            ),
            EnglishLevelCard(
              level: englishLevels[4]['level'],
              color: englishLevels[4]['color'],
              levelName: englishLevels[4]['level_name'],
              currentState: this,
            ),
            EnglishLevelCard(
              level: englishLevels[5]['level'],
              color: englishLevels[5]['color'],
              levelName: englishLevels[5]['level_name'],
              currentState: this,
            ),
            DefaultElevatedButton(title: "Завершить", onPressed: () {
              log("----------final registration started-----------");
              context.read<SigninBloc>().add(SigninLevelButtonPressed(selectedLevel));
            })
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.small(
        backgroundColor: AppColors.blue,
        onPressed: () {},
        child: const Icon(Icons.question_mark),
      ),
    );
  }
}

class EnglishLevelCard extends StatefulWidget {
  EnglishLevelCard({Key? key, required this.level, required this.levelName, required this.color, required this.currentState}) : super(key: key);

  _SigninLevelScreenState currentState;
  final String level;
  final String levelName;
  final Color color;

  @override
  State<EnglishLevelCard> createState() => _EnglishLevelCardState();
}

class _EnglishLevelCardState extends State<EnglishLevelCard> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      onTap: () {
        setState(() {
          log("${identityHashCode(widget.currentState)} ${widget.level}");
          widget.currentState.updateLevel(widget.level);
        });
      },
      title: Container(
        decoration: BoxDecoration(
            color: widget.level != widget.currentState.selectedLevel ? AppColors.white1 : widget.color,
            border: Border.all(color: AppColors.dark.withAlpha(56), width: 2),
            borderRadius: BorderRadius.all(Radius.circular(50))),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
              decoration: BoxDecoration(color: widget.color, borderRadius: BorderRadius.all(Radius.circular(50))),
              child: Text(
                widget.level,
                style: TextStyle(color: AppColors.white1, fontSize: 40),
              ),
            ),
            const SizedBox(width: 20),
            Text(
              widget.levelName,
              style: TextStyle(color: AppColors.cherry),
            )
          ],
        ),
      ),
    );
  }
}
