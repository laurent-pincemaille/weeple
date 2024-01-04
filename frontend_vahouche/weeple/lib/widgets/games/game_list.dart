import 'package:flutter/material.dart';
import 'package:weeple/models/game.dart';
import 'package:weeple/models/user.dart';
import 'package:weeple/screens/home.dart';
import 'package:weeple/widgets/games/empty_game_list_content.dart';
import 'package:weeple/widgets/games/game_list_item.dart';
import 'package:weeple/widgets/navigation/ludotheque.dart';

class GameList extends StatefulWidget {
  const GameList({
    super.key,
    required this.user,
    required this.gameListType,
  });
  final User user;
  final String gameListType;

  @override
  State<GameList> createState() => _LudothequeState();
}

class _LudothequeState extends State<GameList> {
  late final List _gameList;
  @override
  void initState() {
    if (widget.gameListType == "ludothèque") {
      _gameList = widget.user.ludotheque;
    }
    if (widget.gameListType == "wishlist") {
      _gameList = widget.user.wishlist;
    }
    super.initState();
  }
//METHODES

  //DELET GAME
  void _deleteGame({
    required Game game,
    required String gameListeType,
  }) {
    setState(() {
      _gameList.remove(game);
    });
    Navigator.of(context).pop(); //go back to game details
    Navigator.of(context).pop(); //go back to game list
  }

  @override
  Widget build(BuildContext context) {
    if (_gameList.isEmpty && widget.gameListType == "ludothèque") {
      return const EmptyListContent(gameListType: "ludothèque");
    }
    if (_gameList.isEmpty && widget.gameListType == "wishlist") {
      return const EmptyListContent(gameListType: "wishlist");
    }

    return Padding(
      padding: const EdgeInsets.only(left: 4, right: 4),
      child: ListView.builder(
        itemCount: _gameList.length, // items is a List
        itemBuilder: (ctx, index) => GameListitem(
          game: _gameList[index],
          deleteGame: _deleteGame,
          gameListType: widget.gameListType,
        ),
      ),
    );
  }
}
