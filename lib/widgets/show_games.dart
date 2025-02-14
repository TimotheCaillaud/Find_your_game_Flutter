import 'package:flutter/material.dart';
import '../data/game_data.dart';
import 'components/game_bubble.dart';

class ShowGames extends StatelessWidget {
  final List<TextEditingController>? controllers;

  const ShowGames({super.key, this.controllers});

  @override
  Widget build(BuildContext context) {
    final _partyGameController =
        (controllers != null && controllers!.isNotEmpty)
            ? controllers![4].text
            : null;

    final _styleGameController =
        (controllers != null && controllers!.isNotEmpty)
            ? controllers![5].text
            : null;

    final filteredGames = gameCollection.where((game) {
      if (_partyGameController == null ||
          _partyGameController.isEmpty ||
          _styleGameController == null ||
          _styleGameController.isEmpty) {
        return true;
      }
      return game.party == _partyGameController &&
          game.styles.contains(_styleGameController);
    }).toList();

    final theme = Theme.of(context);
    return Wrap(
      children: [
        for (var game in filteredGames)
          GameBubble(
            gameTitle: game.title ?? "Title Missing",
            gameImage: game.image ?? "Image Missing",
          )
      ],
    );
  }
}
