import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:weeple/fake_data/users.dart';
import 'package:weeple/screens/home.dart';
import 'package:weeple/screens/login.dart';
import 'package:weeple/screens/signin.dart';

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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(
        user: users[0],
        pageIndex: 1,
      ),
      // home: Login(),
      // home: SignIn(),
    );
  }
}
