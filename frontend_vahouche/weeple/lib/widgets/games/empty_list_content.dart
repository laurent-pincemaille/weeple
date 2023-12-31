import 'package:flutter/material.dart';
import 'package:weeple/styles.dart';

class EmptyListContent extends StatelessWidget {
  const EmptyListContent({
    super.key,
    required this.gameListType,
  });
  final String gameListType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8, top: 16),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                """Aucun jeu n'est dans votre $gameListType 
pour le moment
vous pouvez en ajouter grâce au bouton""",
                style: const TextStyle(
                    color: primaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              const Icon(
                Icons.add,
                size: 36,
                color: primaryColor,
              )
            ],
          ),
          const Spacer(),
          const Image(
            image: AssetImage("assets/empty.webp"),
            width: 300,
          ),
          const SizedBox(height: 64),
        ],
      ),
    );
  }
}
