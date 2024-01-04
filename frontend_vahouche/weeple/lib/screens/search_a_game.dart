import 'package:flutter/material.dart';
import 'package:weeple/models/user.dart';
import 'package:weeple/screens/login.dart';
import 'package:weeple/styles.dart';
import 'package:weeple/widgets/games/game_list.dart';

class SearchAGame extends StatefulWidget {
  const SearchAGame(
      {super.key, required this.user, required this.gameListType});
  final User user;
  final String gameListType;

  @override
  State<SearchAGame> createState() => _SearchAGameState();
}

class _SearchAGameState extends State<SearchAGame> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text(
          "Agrandisser votre ${widget.gameListType}",
          textAlign: TextAlign.center,
        ),
      ),
      body: Column(
        children: [
          Container(
            color: primaryColorLighter,
            child: const Column(
              children: [
                Input(inputType: InputType.search),
                SizedBox(height: 16)
              ],
            ),
          ),
          Expanded(
              child: GameList(
                  user: widget.user, gameListType: widget.gameListType)),
        ],
      ),
    );
  }
}
