import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier{
  int idx;

  HomeProvider(){
    this.idx = 0;
  }

  void setIdx(int _idx){
    this.idx = _idx;
    notifyListeners();
  }

}