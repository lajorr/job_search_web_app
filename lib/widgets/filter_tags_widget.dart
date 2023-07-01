import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_intern_app/viewmodel/filter_provider.dart';

class FilterTagsWidget extends StatefulWidget {
  const FilterTagsWidget({
    Key? key,
    required this.title,
    required this.index,
  }) : super(key: key);

  @override
  State<FilterTagsWidget> createState() => _FilterTagsWidgetState();

  final String title;
  final int index;
}

class _FilterTagsWidgetState extends State<FilterTagsWidget> {
  Color tileColor = Colors.teal;

  void onRemove() {
    final filter = Provider.of<FilterProvider>(context, listen: false);
    filter.removeFilter(widget.index);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 5,
          ),
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            color: Color.fromARGB(48, 100, 255, 219),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(5),
              topLeft: Radius.circular(5),
            ),
          ),
          child: Text(
            widget.title,
            style: const TextStyle(
              color: Colors.teal,
              // fontWeight: FontWeight.w300,
            ),
          ),
        ),
        //CROSS BUTTON
        InkWell(
          onTap: onRemove,
          onHover: (value) {
            if (value) {
              setState(() {
                tileColor = Colors.black;
              });
            } else {
              setState(() {
                tileColor = Colors.teal;
              });
            }
          },
          hoverColor: Colors.black,
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: tileColor,
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(5),
                topRight: Radius.circular(5),
              ),
            ),
            child: Image.asset(
              "assets/images/cancel.png",
              height: 12,
            ),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
      ],
    );
  }
}
