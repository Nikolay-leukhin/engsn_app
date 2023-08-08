import 'package:engsn_corected/data/models/theme_model.dart';
import 'package:engsn_corected/data/repository/theme_repository.dart';
import 'package:engsn_corected/data/repository/words_repository.dart';
import 'package:engsn_corected/view/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class DictionaryThemeCard extends StatefulWidget {
  ThemeModel theme;

  DictionaryThemeCard({super.key, required this.theme});

  @override
  State<DictionaryThemeCard> createState() => _DictionaryThemeCardState();
}

class _DictionaryThemeCardState extends State<DictionaryThemeCard> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        Navigator.of(context).pushNamed('/dictionary/theme/words', arguments: widget.theme);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(color: AppColors.black, borderRadius: BorderRadius.circular(8)),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            widget.theme.themeName,
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const SizedBox(
            height: 3,
          ),
          Text(
            widget.theme.wordsTheme.length.toString(),
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const SizedBox(
            height: 5,
          ),
          LinearPercentIndicator(
            padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
            trailing: Text('${0.7 * 100}%', style: Theme.of(context).textTheme.labelSmall),
            progressColor: AppColors.purple,
            lineHeight: 10,
            percent: 0.7,
            barRadius: Radius.circular(7),
          )
        ]),
      ),
    );
  }
}
