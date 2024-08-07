import 'package:flutter/material.dart';
import '../../../Helper/recepie_helper.dart';
import '../Modal/recepie_modal.dart';

class RecipeProvider extends ChangeNotifier{
  RecipeHelper recipeHelper = RecipeHelper();
  RecipeModal? recipeModal;

  Future<RecipeModal?> fromApi() async {
    final data = await recipeHelper.fetchDataFromApi();
    recipeModal = RecipeModal.fromJson(data);
    print('------------provider------------------');
    return recipeModal;
  }
}
