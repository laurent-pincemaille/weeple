import 'package:flutter/material.dart';
import 'package:weeple/styles.dart';

class GameListitem extends StatelessWidget {
  const GameListitem({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("clicked");
      },
      child: Card(
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: Container(
                height: 64,
                width: 64,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    color: primaryColorLighter),
              ),
            ),
            const Text("Game Title"),
          ],
        ),
      ),
    );
  }
}
