import 'package:engsn_corected/data/models/theme_model.dart';
import 'package:engsn_corected/logic/home/dictionary/words/words_bloc.dart';
import 'package:engsn_corected/view/screens/dictionary/words_slider.dart';
import 'package:engsn_corected/view/utils/colors.dart';
import 'package:engsn_corected/view/widgets/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DictionaryWordCard extends StatefulWidget {
  final ThemeModel theme;

  const DictionaryWordCard({super.key, required this.theme});

  @override
  State<DictionaryWordCard> createState() => _DictionaryWordCardState();
}

class _DictionaryWordCardState extends State<DictionaryWordCard> {
  @override
  void initState() {
    super.initState();
    context.read<WordsBloc>().add(WordsLoadingEvent(theme: widget.theme));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: context.read<WordsBloc>(),
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.darkcherry,
            title: Center(
              child: Text(
                widget.theme.themeName,
                style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
              ),
            ),
            actions: [
              IconButton(
                icon: const Icon(
                  Icons.settings,
                  color: Colors.white,
                ),
                onPressed: () {
                  // do something
                },
              )
            ],
          ),
          body: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BlocBuilder<WordsBloc, WordsState>(
                  builder: (c, state) {
                    if (state is WordsInitial || state is WordsLoading) {
                      return const Center(child: LoadingIndicator());
                    } else if (state is WordsLoadedSuccess) {
                      return WordsSlider(wordsList: state.words);
                    } else {
                      return Container(
                        height: MediaQuery.of(context).size.height * 0.36,
                        alignment: Alignment.center,
                        child: const Text(
                          'Sorry sometheing went wrong',
                          style: TextStyle(color: Colors.white),
                        ),
                      );
                    }
                  },
                ),
                const SizedBox(height: 15,),
                WordCardButton(
                  buttonName: 'learn'.toUpperCase(),
                ),
                const SizedBox(
                  height: 10,
                ),
                WordCardButton(
                  buttonName: 'test'.toUpperCase(),
                ),
                const SizedBox(
                  height: 10,
                ),
                WordCardButton(
                  buttonName: 'split test'.toUpperCase(),
                ),
              ],
            ),
          )),
    );
  }
}

class WordCardButton extends StatelessWidget {
  final String buttonName;

  const WordCardButton({super.key, required this.buttonName});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      height: 50,
      child: TextButton(
        onPressed: () {},
        child: Text(buttonName, style: TextStyle(color: Colors.white.withAlpha(950), fontSize: 18)),
        style: TextButton.styleFrom(
          backgroundColor: AppColors.blue,
          shape: ContinuousRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    );
  }
}
