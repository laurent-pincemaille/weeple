import 'package:flutter/material.dart';
import 'package:weeple/fake_data/random_list.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home")),
      body: SafeArea(
        child: ListView.builder(
          itemCount: randomList.length, // items is a List
          itemBuilder: (ctx, index) => ListTile(
            title: Text(randomList[index]),
          ),
        ),
      ),
    );
  }
}
