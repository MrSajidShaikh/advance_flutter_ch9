import 'package:flutter/cupertino.dart';

class DetailRecipeProvider extends ChangeNotifier{
  int selectedPage = 0;

  void changePage(int value){
    selectedPage = value;
    notifyListeners();
  }
}
