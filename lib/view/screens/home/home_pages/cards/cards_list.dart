import 'package:flutter/material.dart';

class CardsList extends StatefulWidget {
  const CardsList({Key? key}) : super(key: key);

  @override
  State<CardsList> createState() => _CardsListState();
}

class _CardsListState extends State<CardsList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(children: [Text("Developing")]),
    );
  }
}
