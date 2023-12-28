import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

import 'package:weeple/screens/hello_world.dart';
import 'package:weeple/screens/home.dart';
import 'package:weeple/screens/login.dart';

void main() {
  //ORIENTATION LOCK
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((cb) {
    //RIVERPOD
    runApp(const ProviderScope(child: App()));
  });
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        //HIDE DEBUG BANER
        debugShowCheckedModeBanner: false,
        home: Home());
  }
}
