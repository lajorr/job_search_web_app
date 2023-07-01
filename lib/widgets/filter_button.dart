import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_intern_app/viewmodel/filter_provider.dart';

import '../constants/color.dart';

class FilterButton extends StatefulWidget {
  const FilterButton({super.key});

  @override
  State<FilterButton> createState() => _FilterButtonState();
}

class _FilterButtonState extends State<FilterButton> {
  bool isFilterClicked = false;
  @override
  Widget build(BuildContext context) {
    return Consumer<FilterProvider>(builder: (context, view, _) {
      return InkWell(
        onTap: () {
          setState(() {
            isFilterClicked = !isFilterClicked;
          });
          view.expand();
        },
        child: Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: isFilterClicked ? tagbgDefaultColor : null,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Row(
            children: [
              Image(
                image: AssetImage(
                  isFilterClicked
                      ? 'assets/images/filter.png'
                      : 'assets/images/filter_b.png',
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                'Filter',
                style: TextStyle(
                  color: isFilterClicked ? selectedTextColor : null,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
