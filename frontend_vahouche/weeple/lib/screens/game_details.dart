import 'package:flutter/material.dart';
import 'package:weeple/models/game.dart';
import 'package:weeple/styles.dart';

class GameDetails extends StatelessWidget {
  const GameDetails({
    super.key,
    required this.game,
    required this.deleteGame,
    required this.gameListType,
  });
  final Game game;
  final void Function({
    required Game game,
    required String gameListeType,
  }) deleteGame;
  final String gameListType;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(game.name),
        actions: [
          IconButton(
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return SizedBox(
                        height: 200,
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            children: [
                              Text(
                                "Voulez-vous vraiment effacer ${game.name} de votre $gameListType ?",
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    color: primaryColor,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 32),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          fixedSize: const Size(96, 32),
                                          backgroundColor: primaryColorLighter),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text("Annuler")),
                                  const SizedBox(width: 96),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        fixedSize: const Size(96, 32),
                                        backgroundColor: primaryColor),
                                    onPressed: () {
                                      deleteGame(
                                          game: game,
                                          gameListeType: gameListType);
                                    },
                                    child: const Text("Oui"),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    });
              },
              icon: const Icon(Icons.delete_outline))
        ],
        backgroundColor: primaryColor,
      ),
      backgroundColor: secondaryColor,
      body: Column(children: [
        Image.network(game.imageUrl, width: double.infinity),
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
