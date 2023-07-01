// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:sprung/sprung.dart';

import '../constants/color.dart';

class TagListTile extends StatefulWidget {
  const TagListTile({
    Key? key,
    required this.addFilter,
    required this.keywordTitle,
  }) : super(key: key);

  @override
  State<TagListTile> createState() => _TagListTileState();

  final VoidCallback addFilter;
  final String keywordTitle;
}

class _TagListTileState extends State<TagListTile> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    final hoveredTransform = Matrix4.identity()..translate(0, -8, 0);
    final transform = isHovered ? hoveredTransform : Matrix4.identity();
    return InkWell(
      onTap: widget.addFilter,
      onHover: (value) {
        if (value) {
          setState(() {
            isHovered = true;
          });
        } else {
          setState(() {
            isHovered = false;
          });
        }
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        transform: transform,
        curve: Sprung.overDamped,
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
        ),
        margin: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: isHovered ? tagbgHoverColor : tagbgDefaultColor,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Center(
          child: Text(
            widget.keywordTitle,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.teal,
            ),
          ),
        ),
      ),
    );
  }
}
