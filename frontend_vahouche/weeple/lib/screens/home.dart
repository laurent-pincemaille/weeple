import 'package:flutter/material.dart';
import 'package:weeple/fake_data/users.dart';
import 'package:weeple/models/user.dart';
import 'package:weeple/styles.dart';
import 'package:weeple/widgets/navigation/ludotheque.dart';
import 'package:weeple/widgets/navigation/messages.dart';
import 'package:weeple/widgets/navigation/profil.dart';
import 'package:weeple/widgets/navigation/wishlist.dart';

class Home extends StatefulWidget {
  const Home({
    super.key,
    required this.user,
  });
  final User user;
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _user = users.where((user) => user.id == "id1").toList()[0];
  int _currentIdexPage = 1;
  final List<String> _appBartitles = [
    "Profile",
    "Ludothèque",
    "Wishlist",
    "Messages"
  ];
  late String _appBartitle;
  List<Widget> _appBarAction = [];

  @override
  void initState() {
    _appBartitle = _appBartitles[_currentIdexPage];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (_currentIdexPage == 3) {
      _appBarAction = [];
    }
    if (_currentIdexPage == 0) {
      _appBarAction = [
        IconButton(onPressed: () {}, icon: const Icon(Icons.settings_outlined))
      ];
    }
    if (_currentIdexPage == 1 || _currentIdexPage == 2) {
      _appBarAction = [
        IconButton(onPressed: () {}, icon: const Icon(Icons.add))
      ];
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(_appBartitle),
        actions: _appBarAction,
        backgroundColor: primaryColor,
      ),
      backgroundColor: secondaryColor,
      body: SafeArea(
        child: <Widget>[
          Profil(user: widget.user),
          Ludotheque(user: _user),
          Wishlist(user: _user),
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
