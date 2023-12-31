import 'package:flutter/material.dart';
import 'package:weeple/models/game.dart';
import 'package:weeple/screens/game_details.dart';

class GameListitem extends StatelessWidget {
  const GameListitem({
    super.key,
    required this.game,
  });
  final Game game;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (ctx) => GameDetails(
                  game: game,
                )));
        ;
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
