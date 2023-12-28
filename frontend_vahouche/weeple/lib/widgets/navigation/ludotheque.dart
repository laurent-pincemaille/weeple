import 'package:flutter/material.dart';
import 'package:weeple/fake_data/random_list.dart';
import 'package:weeple/widgets/games/game_list_item.dart';

class Ludotheque extends StatelessWidget {
  const Ludotheque({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 4, right: 4),
      child: ListView.builder(
          itemCount: randomList.length, // items is a List
          itemBuilder: (ctx, index) => const GameListitem()),
    );
  }
}
