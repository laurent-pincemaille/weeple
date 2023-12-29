import 'package:flutter/material.dart';
import 'package:weeple/styles.dart';
import 'package:weeple/widgets/navigation/ludotheque.dart';
import 'package:weeple/widgets/navigation/messages.dart';
import 'package:weeple/widgets/navigation/profil.dart';
import 'package:weeple/widgets/navigation/wishlist.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIdexPage = 1;
  final List<String> _appBartitles = [
    "Profile",
    "Ludothèque",
    "Wishlist",
    "Messages"
  ];
  late String _appBartitle;
  @override
  void initState() {
    _appBartitle = _appBartitles[_currentIdexPage];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_appBartitle),
        actions: _currentIdexPage == 1 || _currentIdexPage == 2
            ? [IconButton(onPressed: () {}, icon: const Icon(Icons.add))]
            : [],
        backgroundColor: primaryColor,
      ),
      backgroundColor: secondaryColor,
      body: SafeArea(
        child: <Widget>[
          const Profil(),
          const Ludotheque(),
          const Wishlist(),
          const Messages(),
        ][_currentIdexPage],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIdexPage,
        backgroundColor: primaryColor,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
        onDestinationSelected: (int index) {
          setState(() {
            _currentIdexPage = index;
            _appBartitle = _appBartitles[index];
          });
        },
        destinations: <Widget>[
          NavigationDestination(
            selectedIcon: const Icon(Icons.person, color: primaryColorLightest),
            icon: const Icon(Icons.person_outline, color: primaryColorLightest),
            label: _appBartitles[0],
          ),
          NavigationDestination(
            selectedIcon: const Icon(Icons.casino, color: primaryColorLightest),
            icon:
                const Icon(Icons.casino_outlined, color: primaryColorLightest),
            label: _appBartitles[1],
          ),
          NavigationDestination(
            selectedIcon:
                const Icon(Icons.favorite, color: primaryColorLightest),
            icon:
                const Icon(Icons.favorite_outline, color: primaryColorLightest),
            label: _appBartitles[2],
          ),
          NavigationDestination(
            selectedIcon:
                const Icon(Icons.message, color: primaryColorLightest),
            icon:
                const Icon(Icons.message_outlined, color: primaryColorLightest),
            label: _appBartitles[3],
          ),
        ],
      ),
    );
  }
}
