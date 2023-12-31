import 'package:weeple/fake_data/games.dart';
import 'package:weeple/models/user.dart';

List<User> users = [
  User(
    id: "id1",
    mail: "vava@gmail.com",
    password: "kikou",
    pseudo: "Vahouch",
    address: "23 villa Deshayes, 75014 PARIS",
    ludotheque: [
      gamesDB.where((game) => game.id == "id1").toList()[0],
      gamesDB.where((game) => game.id == "id2").toList()[0],
      gamesDB.where((game) => game.id == "id3").toList()[0],
      gamesDB.where((game) => game.id == "id4").toList()[0],
      gamesDB.where((game) => game.id == "id5").toList()[0],
      gamesDB.where((game) => game.id == "id6").toList()[0],
      gamesDB.where((game) => game.id == "id7").toList()[0],
      gamesDB.where((game) => game.id == "id8").toList()[0],
      gamesDB.where((game) => game.id == "id9").toList()[0],
    ],
    wishlist: [
      // gamesDB.where((game) => game.id == "id1").toList()[0],
      // gamesDB.where((game) => game.id == "id2").toList()[0],
    ],
  ),
];
