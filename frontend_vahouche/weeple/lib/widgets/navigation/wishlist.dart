import 'package:flutter/material.dart';
import 'package:weeple/styles.dart';

class Wishlist extends StatelessWidget {
  const Wishlist({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(left: 8, right: 8, top: 16),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                """Aucun jeu n'est sur votre wishlist 
pour le moment
vous pouvez en ajouter grâce au bouton""",
                style: TextStyle(
                    color: primaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              Icon(
                Icons.add,
                size: 36,
                color: primaryColor,
              )
            ],
          ),
          Spacer(),
          Image(
            image: AssetImage("assets/empty.webp"),
            width: 300,
          ),
          SizedBox(height: 64),
        ],
      ),
    );
  }
}
