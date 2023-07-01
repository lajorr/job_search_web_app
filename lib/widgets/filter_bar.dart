import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import 'package:web_intern_app/widgets/filter_button.dart';
import 'package:web_intern_app/widgets/filter_tags_widget.dart';
import 'package:web_intern_app/widgets/tag_list_tile.dart';

import '../viewmodel/filter_provider.dart';

class FilterBar extends StatefulWidget {
  const FilterBar({super.key});

  @override
  State<FilterBar> createState() => _FilterBarState();
}

class _FilterBarState extends State<FilterBar>
    with SingleTickerProviderStateMixin {
  bool isFilterClicked = false;
  bool isSortClicked = false;
  bool isHovered = false;

  double turn = 0;
  int count = 0;

  void addFilter(String keyWordTitle) {
    Provider.of<FilterProvider>(context, listen: false).addFilter(keyWordTitle);
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      // height: 70,
      width: MediaQuery.of(context).size.width,
      top: 115,
      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 100,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 25,
          vertical: 20,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(28, 1, 109, 98),
              blurRadius: 5,
              offset: Offset(0, 10),
            ),
          ],
        ),
        child: Consumer<FilterProvider>(
          builder: (context, view, _) {
            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: SizedBox(
                        width: double.infinity,
                        height: 30,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: view.filterTagList.length,
                          itemBuilder: (context, index) => FilterTagsWidget(
                            title: view.filterTagList[index],
                            index: index,
                          ),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        //Clear Button
                        if (view.filterTagList.isNotEmpty) const ClearText(),
                        //filter button
                        const FilterButton(),
                      ],
                    ),
                  ],
                ),
                if (view.isExpanded)
                  Container(
                    margin: const EdgeInsets.only(
                      top: 15,
                    ),
                    height: 120,
                    child: MasonryGridView.builder(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.all(5),
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      ),
                      mainAxisSpacing: 22,
                      // crossAxisSpacing: 5,
                      itemCount: FilterProvider.keywordsList.length,
                      itemBuilder: (context, index) {
                        return TagListTile(
                          addFilter: () => addFilter(
                            FilterProvider.keywordsList[index],
                          ),
                          keywordTitle: FilterProvider.keywordsList[index],
                        );
                      },
                    ),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class ClearText extends StatefulWidget {
  const ClearText({super.key});

  @override
  State<ClearText> createState() => _ClearTextState();
}

class _ClearTextState extends State<ClearText> {
  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 8.0,
      ),
      child: Consumer<FilterProvider>(builder: (context, view, _) {
        return InkWell(
          onTap: () {
            view.removeAllFilter();
            // Provider.of<ServiceProvider>(context,listen: false).filteredList(view.filterTagList);
          },
          onHover: (value) {
            if (value) {
              setState(() {
                isHover = true;
              });
            } else {
              setState(() {
                isHover = false;
              });
            }
          },
          child: Container(
            padding: const EdgeInsets.all(9),
            decoration: BoxDecoration(
              color: isHover ? const Color.fromARGB(255, 255, 205, 202) : null,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Text(
              'Clear',
              style: TextStyle(
                // fontSize: 16,
                letterSpacing: 1,
                fontWeight: FontWeight.bold,
                color: isHover
                    ? const Color.fromARGB(255, 197, 19, 6)
                    : Colors.black,
                decoration:
                    isHover ? TextDecoration.underline : TextDecoration.none,
              ),
            ),
          ),
        );
      }),
    );
  }
}
