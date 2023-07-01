// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:sprung/sprung.dart';

import '../constants/color.dart';

class AnimatedText extends StatefulWidget {
  const AnimatedText({
    Key? key,
    required this.position,
  }) : super(key: key);

  @override
  State<AnimatedText> createState() => _AnimatedTextState();

  final String position;
}

class _AnimatedTextState extends State<AnimatedText> {
  bool isHovered = false;
  @override
  Widget build(BuildContext context) {
    final hoveredTransform = Matrix4.identity()
      ..translate(0, -5, 0)
      ..scale(1.05);
    final transform = isHovered ? hoveredTransform : Matrix4.identity();
    return MouseRegion(
      // cursor: MouseCursor.defer,
      cursor: SystemMouseCursors.click,
      onEnter: (event) {
        setState(() {
          isHovered = true;
        });
      },
      onExit: (event) {
        setState(() {
          isHovered = false;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Sprung.overDamped,
        transform: transform,
        child: Text(
          widget.position,
          style: TextStyle(
            color: isHovered ? selectedTextColor : null,
            fontSize: 18,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
    );
  }
}
