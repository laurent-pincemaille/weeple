import 'package:flutter/material.dart';

class HelloWordl extends StatelessWidget {
  const HelloWordl({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Hello World")),
      body: const SafeArea(
        child: Center(
          child: Text("juste ici pour tester"),
        ),
      ),
    );
  }
}
