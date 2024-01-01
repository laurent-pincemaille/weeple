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
    if (widget.gameListType == "ludotheque") {
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
    if (gameListeType == "ludotheque") {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (ctx) => Home(user: widget.user, pageIndex: 1),
        ),
      );
    }
    if (gameListeType == "wishlist") {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (ctx) => Home(user: widget.user, pageIndex: 2),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_gameList.isEmpty) {
      return const EmptyListContent(gameListType: "ludothèque");
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
