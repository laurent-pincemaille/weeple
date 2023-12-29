import 'package:flutter/material.dart';
import 'package:weeple/screens/login.dart';
import 'package:weeple/styles.dart';

class Profil extends StatelessWidget {
  const Profil({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (ctx) => const Login(),
                  ),
                );
              },
              child: const Text(
                "deconnexion",
                style: TextStyle(color: primaryColorLighter),
              ))
        ],
      ),
    );
  }
}
