import 'package:flutter/cupertino.dart';

import '../../../Utils/globals.dart';

class ECommerceHomeProvider extends ChangeNotifier{
  String? search;

  void searchProducts(String value){
    search = value;
    notifyListeners();
  }

  void removeSearch(){
    txtEcommerceSearch.clear();
    notifyListeners();
  }
}