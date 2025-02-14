import 'package:flutter/material.dart';

class MaxWidthContainer extends StatelessWidget {
  final Widget child;

  const MaxWidthContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: constraints.maxWidth > 860 ? 830 : constraints.maxWidth,
            ),
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: child,
            ),
          ),
        );
      },
    );
  }
}