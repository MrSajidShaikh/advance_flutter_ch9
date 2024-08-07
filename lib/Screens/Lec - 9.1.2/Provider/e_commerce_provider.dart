import 'package:flutter/cupertino.dart';

import '../../../Helper/e_commerce_helper.dart';
import '../Modal/e_commerce_modal.dart';

class ECommerceProvider extends ChangeNotifier{
  ECommerceHelper eCommerceHelper = ECommerceHelper();
  ECommerceModal? eCommerceModal;

  Future<ECommerceModal?> fromApi() async {
    final data = await eCommerceHelper.fetchDataFromApi();
    eCommerceModal = ECommerceModal.fromJson(data);
    print('-----------------Provider----------------------');
    // notifyListeners();
    return eCommerceModal;
  }
}
