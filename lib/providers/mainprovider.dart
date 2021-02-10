import 'package:digou/pages/homepages/homepage.dart';
import 'package:flutter/material.dart';

class MainProvider extends ChangeNotifier {
  int idx;

  Map<int, Widget> _pages = {};
  Widget get page => this._pages[this.idx];

  MainProvider() {
    this.setIdx(0);
  }

  void setIdx(int _idx) {
    this.idx = _idx;
    if (this.idx == 0) {
      if (!_pages.containsKey(0)) {
        _pages[0] = HomePage();
      }
    } else {
      _pages[this.idx] = Container();
    }
    notifyListeners();
  }
}
