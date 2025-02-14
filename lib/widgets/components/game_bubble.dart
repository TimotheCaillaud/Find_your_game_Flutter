import 'package:flutter/material.dart';

class GameBubble extends StatefulWidget {
  final String gameTitle;
  final String gameImage;

  const GameBubble({
    super.key,
    this.gameTitle = "Game name missing",
    this.gameImage = "Link missing",
  });

  @override
  State<GameBubble> createState() {
    return _GameBubbleState();
  }
}

class _GameBubbleState extends State<GameBubble> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ClipRRect(
          borderRadius:
              BorderRadius.circular(15), // Adjust the radius as needed
          child: Image.asset(
            widget.gameImage,
            fit: BoxFit.cover,
            width: 120,
            height: 120,
          ),
        ),
        Text(
          widget.gameTitle,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
