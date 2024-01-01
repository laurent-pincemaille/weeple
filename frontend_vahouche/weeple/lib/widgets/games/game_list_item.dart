import 'package:flutter/material.dart';
import 'package:weeple/models/game.dart';
import 'package:weeple/screens/game_details.dart';

class GameListitem extends StatelessWidget {
  const GameListitem({
    super.key,
    required this.game,
    required this.deleteGame,
    required this.gameListType,
  });
  final Game game;
  final void Function({required Game game, required String gameListeType})
      deleteGame;
  final String gameListType;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (ctx) => GameDetails(
              game: game,
              deleteGame: deleteGame,
              gameListType: gameListType,
            ),
          ),
        );
      },
      child: Card(
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: Container(
                height: 64,
                width: 64,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  image: DecorationImage(
                      image: NetworkImage(game.imageUrl), fit: BoxFit.contain),
                ),
              ),
            ),
            Text(game.name),
          ],
        ),
      ),
    );
  }
}
