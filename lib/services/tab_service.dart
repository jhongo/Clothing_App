import 'package:flutter/material.dart';

class TabService extends ChangeNotifier {

  PageController _pageController = PageController();
  int _indexPage = 0;
  bool _isActive = false;
  String _itemCategory = 'electronics';


  String get itemCategory{
    return _itemCategory;
  }
  set itemCategory(String name){
    _itemCategory = name;
    notifyListeners();
  }


  PageController get controllerPage{
    return _pageController;
  }
  
  int get index{
    return _indexPage;
  }

  set index(int index){
     _indexPage = index;
     _pageController.animateToPage(index, duration: Duration(milliseconds: 500), curve:Curves.easeIn);
     notifyListeners();
  }

  bool get isActive{
    return _isActive;
  }

  set isActive(bool condition){
    _isActive = condition;
    notifyListeners();
  }





  
}