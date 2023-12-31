class Game {
  const Game({
    required this.id,
    required this.name,
    required this.playerMmin,
    required this.playerMax,
    required this.duration,
    required this.description,
    required this.imageUrl,
  });
  final String id;
  final String name;
  final int playerMmin;
  final int playerMax;
  final int duration;
  final String description;
  final String imageUrl;
}
