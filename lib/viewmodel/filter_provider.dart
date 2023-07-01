import 'package:flutter/material.dart';

class FilterProvider extends ChangeNotifier {
  static const keywordsList = [
    'JavaScript',
    'CSS',
    'React',
    'SQL',
    'Nodejs',
    'MySQL',
    '.NET Core',
    'C#',
    'ETL',
    'Apache Spark',
    'Python',
    'Cypress',
    'Selenium',
    'HTML',
    'Frontend',
  ];

  List<String> _filterTagList = [];

  List<String> get filterTagList {
    return _filterTagList;
  }

  bool _isExpanded = false;

  bool get isExpanded {
    return _isExpanded;
  }

  void expand() {
    _isExpanded = !_isExpanded;
    notifyListeners();
  }

  void addFilter(String tag) {
    for (int i = 0; i < _filterTagList.length; i++) {
      if (tag == _filterTagList[i]) {
        print("Exists");
        return;
      }
    }
    _filterTagList.add(tag);

    notifyListeners();
  }

  void removeFilter(int index) {
    _filterTagList.removeAt(index);
    notifyListeners();
  }

  void removeAllFilter() {
    _filterTagList = [];
    notifyListeners();
  }
}
