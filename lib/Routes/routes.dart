import 'package:flutter/material.dart';

import '../Screens/Lec - 9.1.2/View/e_commerce_cart_screen.dart';
import '../Screens/Lec - 9.1.2/View/e_commerce_detail_screen.dart';
import '../Screens/Lec - 9.1.2/View/e_commerce_home_screen.dart';
import '../Screens/Lec - 9.1/View/detail_screen_recepie.dart';
import '../Screens/Lec - 9.1/View/home_screen_recepie.dart';
import '../Screens/Lec - 9.2/View/detail_screen_pixabay.dart';
import '../Screens/Lec - 9.2/View/pixabay_api_calling.dart';

class MyRoutes {
  static Map<String, Widget Function(BuildContext)> myRoutes = {
    '/': (context) => const PixabayApi(),
    '/detailP': (context) => const DetailScreenPixabay(),
    '/homeE': (context) => const ECommerceHomeScreen(),
    '/cartE': (context) => const ECommerceCartScreen(),
    '/detailE': (context) => const ECommerceDetailScreen(),
    '/home': (context) => const HomeScreenRecipe(),
    '/detail': (context) => const DetailScreenRecipe(),
    '/pixabay': (context) => const PixabayApi(),
  };
}
