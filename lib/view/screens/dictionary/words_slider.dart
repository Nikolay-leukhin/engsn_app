import 'package:carousel_slider/carousel_slider.dart';
import 'package:engsn_corected/data/models/words_model.dart';
import 'package:engsn_corected/view/screens/dictionary/word_flip_card.dart';
import 'package:flutter/material.dart';

class WordsSlider extends StatefulWidget {
  final List<WordsModel> wordsList;
  const WordsSlider({super.key, required this.wordsList});

  @override
  State<WordsSlider> createState() => _WordsSliderState();
}

class _WordsSliderState extends State<WordsSlider> {
  int currentIndex = 0;
  final PageController _controller = PageController(initialPage: 0);

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.36,
          alignment: Alignment.center,
          child: PageView.builder(
              onPageChanged: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
              controller: _controller,
              itemBuilder: (context, index) {
                return WordFlipCard(
                  word: widget.wordsList[index % widget.wordsList.length],
                );
              }),
        ),
        const SizedBox(height: 15,),
        Text("${(currentIndex) % widget.wordsList.length + 1} / ${widget.wordsList.length}", style: TextStyle(color: Colors.white),)

      ],
    );
  }
}
