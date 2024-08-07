import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Routes/routes.dart';
import 'Screens/Lec - 9.1.2/Provider/e_commerce_cart_provider.dart';
import 'Screens/Lec - 9.1.2/Provider/e_commerce_home_provider.dart';
import 'Screens/Lec - 9.1.2/Provider/e_commerce_provider.dart';
import 'Screens/Lec - 9.1/Provider/detail_recepie_provider.dart';
import 'Screens/Lec - 9.1/Provider/recepie_provider.dart';
import 'Screens/Lec - 9.2/Provider/pixabay_api_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => PixabayApiProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => RecipeProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => DetailRecipeProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ECommerceProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ECommerceHomeProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ECommerceCartProvider(),
        ),
      ],
      builder: (context, child) => MaterialApp(
        theme: ThemeData.dark(),
        debugShowCheckedModeBanner: false,
        routes: MyRoutes.myRoutes,
      ),
    );
  }
}
