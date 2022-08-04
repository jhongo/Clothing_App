import 'package:flutter/material.dart';


class NavBarService extends ChangeNotifier{

  int _opcSelect = 0;
  PageController _pageController = PageController();

  int get opcSelectedGet{
    return _opcSelect;
  }

  PageController get controller{
    return _pageController;
  }

  set opcSelectedSet(int opcion){
    _opcSelect = opcion;
    _pageController.animateToPage(opcion, duration: Duration(milliseconds: 250), curve: Curves.easeIn);
    notifyListeners();
  }
  
}