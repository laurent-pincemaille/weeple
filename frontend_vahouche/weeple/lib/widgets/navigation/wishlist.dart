import 'package:flutter/material.dart';
import 'package:weeple/models/user.dart';
import 'package:weeple/widgets/games/empty_list_content.dart';
import 'package:weeple/widgets/games/game_list.dart';

class Wishlist extends StatelessWidget {
  const Wishlist({super.key, required this.user});
  final User user;

  @override
  Widget build(BuildContext context) {
    final List gameList = user.wishlist;
    if (gameList.isEmpty) {
      return const EmptyListContent(gameListType: 'wishlist');
    }
    return GameList(user: user, gameListType: "wishlist");
  }
}
