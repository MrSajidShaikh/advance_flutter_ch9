import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../Utils/globals.dart';
import '../Provider/recepie_provider.dart';

class HomeScreenRecipe extends StatelessWidget {
  const HomeScreenRecipe({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var recipeProviderFalse =
    Provider.of<RecipeProvider>(context, listen: false);
    var recipeProviderTrue = Provider.of<RecipeProvider>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0.1,
        centerTitle: true,
        leading: const Icon(Icons.account_circle_outlined),
        title: const Text('Recipe'),
      ),
      body: FutureBuilder(
        future: recipeProviderFalse.fromApi(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Not sure what to\ncook tonight?',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                        Container(
                          height: height * 0.055,
                          width: width * 0.12,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Icon(Icons.filter_alt),
                        ),
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10, bottom: 10),
                      height: height * 0.18,
                      width: width,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/header.avif'),
                        ),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Start from \$10 per month',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              'Generate Unlimited\nRecipe!',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Text(
                      'Recipes',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                    Wrap(
                      spacing: 10,
                      children: [
                        ...List.generate(
                          recipeProviderTrue.recipeModal!.recipes.length,
                              (index) => InkWell(
                            onTap: () {
                              selectedIndex = index;
                              Navigator.of(context).pushNamed('/detail');
                            },
                            child: recipeHomeDetails(
                              height: height,
                              width: width,
                              recipeProviderTrue: recipeProviderTrue,
                              index: index,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  Widget recipeHomeDetails({
    required double height,
    required double width,
    required RecipeProvider recipeProviderTrue,
    required int index,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 10, top: 10),
          height: height * 0.17,
          width: width * 0.449,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                recipeProviderTrue.recipeModal!.recipes[index].image,
              ),
            ),
          ),
        ),
        SizedBox(
          width: width * 0.4,
          child: Text(
            recipeProviderTrue.recipeModal!.recipes[index].name,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        ),
        Text(
          recipeProviderTrue.recipeModal!.recipes[index].tags[1],
          style: const TextStyle(
            fontSize: 14,
          ),
        ),
        Text(
          '${recipeProviderTrue.recipeModal!.recipes[index].reviewCount} Reviews',
          style: const TextStyle(
            fontSize: 16,
          ),
        ),
        SizedBox(
          height: height * 0.01,
        ),
      ],
    );
  }
}
