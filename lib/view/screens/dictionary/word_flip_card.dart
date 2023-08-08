import 'package:engsn_corected/data/models/words_model.dart';
import 'package:engsn_corected/view/utils/colors.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';

class WordFlipCard extends StatefulWidget {
  final WordsModel word;
  const WordFlipCard({super.key, required this.word});

  @override
  State<WordFlipCard> createState() => _WordFlipCardState();
}

class _WordFlipCardState extends State<WordFlipCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      
      margin: const EdgeInsets.symmetric(horizontal: 5),
      child: FlipCard(
        direction: FlipDirection.HORIZONTAL,
        side: CardSide.FRONT,
        front: WordFlipCardFrontSide(word: widget.word),
        back: WordFlipCardBackSide(word: widget.word),
      ),
    );
  }
}

class WordFlipCardFrontSide extends StatelessWidget {
  final WordsModel word;
  const WordFlipCardFrontSide({super.key, required this.word});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: AppColors.orange,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
      Text(
        word.name,
        style: TextStyle(color: AppColors.white1, fontSize: 34),
      ),
      Text(
        '[${word.transcription}]'
      )
        ],
      ),
    );
  }
}



class WordFlipCardBackSide extends StatelessWidget {
  final WordsModel word;
  const WordFlipCardBackSide({super.key, required this.word});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.purple,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
      Text(
        word.translation,
        style: TextStyle(color: AppColors.white1, fontSize: 34),
      ),
      Text(
        '[${word.explanation}]',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 14,
        ),
      )
        ],
      ),
    );
  }
}