import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class ECommerceHelper {

  Future<Map> fetchDataFromApi() async {
    Uri url = Uri.parse('https://dummyjson.com/products');
    Response response = await http.get(url);

    if (response.statusCode == 200) {
      final Map data = jsonDecode(response.body);
      return data;
    } else {
      return {};
    }
  }
}

// import 'dart:convert';
//
// import 'package:http/http.dart';
// import 'package:http/http.dart' as http;
//
// class RecipeHelper{
//
//   Future<Map> fetchDataFromApi() async {
//     Uri url = Uri.parse('https://dummyjson.com/recipes');
//     Response response = await http.get(url);
//
//     if(response.statusCode == 200){
//       final Map data = jsonDecode(response.body);
//       return data;
//     }
//     else{
//       return {};
//     }
//   }
// }
