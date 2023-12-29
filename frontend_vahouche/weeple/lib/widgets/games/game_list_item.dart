import 'package:flutter/material.dart';
import 'package:weeple/styles.dart';

class GameListitem extends StatelessWidget {
  const GameListitem({
    super.key,
    required this.game,
  });
  final Map game;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("${game["title"]} clicked");
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
                      image: NetworkImage(game["url"]), fit: BoxFit.contain),
                ),
              ),
            ),
            Text(game["title"]),
          ],
        ),
      ),
    );
  }
}
