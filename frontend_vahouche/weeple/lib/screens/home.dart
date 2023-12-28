import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home")),
      body: const SafeArea(
        child: Center(
          child: Text("Bienvenu !!!"),
        ),
      ),
    );
  }
}
