class Game {
  final String title;
  final String image;
  final String party;
  final int minPlayer;
  final int maxPlayer;
  final List<String> styles; // ✅ Corrected List type

  const Game({
    required this.title,
    required this.image,
    required this.party,
    required this.minPlayer,
    required this.maxPlayer,
    required this.styles,
  });
}

const List<Game> gameCollection = [
  Game(
    title: "Très Futé",
    image: 'assets/images/tres_fute.jpeg',
    minPlayer: 1,
    maxPlayer: 4,
    party: 'alone',
    styles: ['roll_and_write'],
  ),
  Game(
    title: "Twilight Inscription",
    image: 'assets/images/Twilight-Inscription.jpg',
    minPlayer: 1,
    maxPlayer: 8,
    party: 'alone',
    styles: ['roll_and_write'],
  ),
  Game(
    title: "Dune",
    image: 'assets/images/dune-imperium.jpg',
    minPlayer: 2,
    maxPlayer: 4,
    party: 'alone',
    styles: ['deckbuilding'],
  ),
  Game(
    title: "Shadow Hunter",
    image: 'assets/images/shadow_hunter.jpg',
    minPlayer: 2,
    maxPlayer: 4,
    party: 'team',
    styles: ['ambiance'],
  ),
    Game(
    title: "Code Names",
    image: 'assets/images/CodeNames.jpg',
    minPlayer: 2,
    maxPlayer: 4,
    party: 'team',
    styles: ['ambiance'],
  ),
];
