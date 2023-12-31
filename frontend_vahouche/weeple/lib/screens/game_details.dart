import 'package:flutter/material.dart';
import 'package:weeple/models/game.dart';
import 'package:weeple/styles.dart';

class GameDetails extends StatelessWidget {
  const GameDetails({
    super.key,
    required this.game,
  });
  final Game game;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(game.name),
        backgroundColor: primaryColor,
      ),
      backgroundColor: secondaryColor,
      body: Column(children: [
        Stack(
          children: [
            Image.network(game.imageUrl, width: double.infinity),
            Positioned(
              left: 8,
              bottom: 16,
              child: Container(
                width: 64,
                height: 64,
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(32),
                  border: Border.all(
                    color: primaryColorLightest,
                    width: 4,
                  ),
                ),
                child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.delete_outline,
                      size: 32,
                      color: primaryColorLightest,
                    )),
              ),
            ),
          ],
        ),
        Container(
          color: primaryColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8),
                child: Row(
                  children: [
                    const Icon(
                      Icons.group,
                      color: primaryColorLightest,
                      size: 32,
                    ),
                    Text(
                      " ${game.playerMmin} - ${game.playerMax}",
                      style: const TextStyle(
                          color: primaryColorLightest,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Row(
                  children: [
                    const Icon(
                      Icons.hourglass_top,
                      color: primaryColorLightest,
                      size: 32,
                    ),
                    Text(
                      "${game.duration} min",
                      style: const TextStyle(
                          color: primaryColorLightest,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8),
          child: Text(
            game.description,
            style: const TextStyle(color: primaryColor, fontSize: 16),
          ),
        )
      ]),
    );
  }
}
