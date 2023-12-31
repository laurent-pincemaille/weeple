import 'package:weeple/models/game.dart';

class User {
  User({
    required this.id,
    required this.mail,
    required this.password,
    required this.pseudo,
    required this.address,
    required this.ludotheque,
    required this.wishlist,
  });
  final String id;
  final String mail;
  final String password;
  final String pseudo;
  final String address;
  List<Game> ludotheque;
  List<Game> wishlist;
}
