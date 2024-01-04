import 'package:flutter/material.dart';
import 'package:weeple/models/user.dart';
import 'package:weeple/widgets/games/empty_game_list_content.dart';
import 'package:weeple/widgets/games/game_list.dart';

class Ludotheque extends StatelessWidget {
  const Ludotheque({super.key, required this.user});
  final User user;

  @override
  Widget build(BuildContext context) {
    final List gameList = user.ludotheque;
    if (gameList.isEmpty) {
      return const EmptyListContent(gameListType: "ludothèque");
    }
    return GameList(user: user, gameListType: "ludothèque");
  }
}
