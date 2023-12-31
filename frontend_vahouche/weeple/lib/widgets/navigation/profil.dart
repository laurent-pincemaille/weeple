import 'package:flutter/material.dart';
import 'package:weeple/models/user.dart';
import 'package:weeple/screens/login.dart';
import 'package:weeple/styles.dart';

class Profil extends StatelessWidget {
  const Profil({
    super.key,
    required this.user,
  });
  final User user;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(user.pseudo),
          Row(
            children: [
              const Text("email : "),
              Text(user.mail),
            ],
          ),
          Row(
            children: [
              const Text("adresse : "),
              Text(user.address),
            ],
          ),
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
            ),
          )
        ],
      ),
    );
  }
}
