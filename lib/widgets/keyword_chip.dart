// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../constants/color.dart';

class KeywordChip extends StatelessWidget {
  const KeywordChip({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      hoverColor: tagbgHoverColor,
      onTap: () {},
      borderRadius: BorderRadius.circular(5),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
        ),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: tagbgDefaultColor.withOpacity(0.5),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Text(
          title,
          style:  TextStyle(
            color: titleTextColor,
              
          ),
        ),
      ),
    );
  }
}
