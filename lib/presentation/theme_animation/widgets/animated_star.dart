import 'package:flutter/material.dart';

import 'star.dart';

class AnimatedStar extends StatelessWidget {
  final double top;
  final double? right;
  final double? left;
  final int durationInMillisec;
  final double opacity;

  const AnimatedStar({
    super.key,
    required this.top,
    this.right,
    required this.durationInMillisec,
    required this.opacity,
    this.left,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      right: right,
      left: left,
      child: AnimatedOpacity(
        duration: Duration(milliseconds: durationInMillisec),
        opacity: opacity,
        child: const Star(),
      ),
    );
  }
}
