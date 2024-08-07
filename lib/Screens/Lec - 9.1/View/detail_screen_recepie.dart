import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../Utils/globals.dart';
import '../Provider/detail_recepie_provider.dart';
import '../Provider/recepie_provider.dart';

class DetailScreenRecipe extends StatelessWidget {
  const DetailScreenRecipe({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var recipeProviderFalse =
    Provider.of<RecipeProvider>(context, listen: false);
    var recipeProviderTrue = Provider.of<RecipeProvider>(context, listen: true);
    var detailRecipeProviderFalse =
    Provider.of<DetailRecipeProvider>(context, listen: false);
    var detailRecipeProviderTrue =
    Provider.of<DetailRecipeProvider>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: const Icon(Icons.account_circle_outlined),
        title: const Text('Recipe Details'),
      ),
      body: FutureBuilder(
        future: recipeProviderFalse.fromApi(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: [
                SizedBox(
                  height: height * 0.35,
                  width: width,
                  child: Image.network(
                    recipeProviderTrue
                        .recipeModal!.recipes[selectedIndex].image,
                    fit: BoxFit.cover,
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    width: width,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                        topLeft: Radius.circular(10),
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: height * 0.01,
                        ),
                        Text(
                          recipeProviderTrue
                              .recipeModal!.recipes[selectedIndex].name,
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: height * 0.03,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                border:
                                (detailRecipeProviderTrue.selectedPage == 0)
                                    ? const Border(
                                  bottom: BorderSide(
                                    width: 3,
                                    color: Colors.amber,
                                  ),
                                )
                                    : null,
                              ),
                              child: const Text(
                                'Ingredients',
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                border:
                                (detailRecipeProviderTrue.selectedPage == 1)
                                    ? const Border(
                                  bottom: BorderSide(
                                    width: 3,
                                    color: Colors.amber,
                                  ),
                                )
                                    : null,
                              ),
                              child: const Text(
                                'Instructions',
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        Expanded(
                          flex: 2,
                          child: PageView(
                            onPageChanged: (value) {
                              detailRecipeProviderFalse.changePage(value);
                            },
                            children: [
                              Text(
                                recipeProviderTrue.recipeModal!
                                    .recipes[selectedIndex].ingredients
                                    .join(),
                                style: const TextStyle(
                                  fontSize: 22,
                                ),
                              ),
                              Text(
                                recipeProviderTrue.recipeModal!
                                    .recipes[selectedIndex].instructions
                                    .join(),
                                style: const TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(10),
                                height: height * 0.11,
                                width: width * 0.3,
                                decoration: BoxDecoration(
                                  color: Colors.amber,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: [
                                        const Icon(
                                          Icons.watch_later_outlined,
                                          color: Colors.black,
                                        ),
                                        SizedBox(
                                          width: width * 0.01,
                                        ),
                                        Text(
                                          '${recipeProviderTrue.recipeModal!.recipes[selectedIndex].cookTimeMinutes} Mins',
                                          style: const TextStyle(
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: height * 0.01,
                                    ),
                                    const Text(
                                      'Cooking Time',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(10),
                                height: height * 0.11,
                                width: width * 0.3,
                                decoration: BoxDecoration(
                                  color: Colors.amber,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: [
                                        const Icon(
                                          Icons.watch_later_outlined,
                                          color: Colors.black,
                                        ),
                                        SizedBox(
                                          width: width * 0.01,
                                        ),
                                        Text(
                                          '${recipeProviderTrue.recipeModal!.recipes[selectedIndex].prepTimeMinutes} Mins',
                                          style: const TextStyle(
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: height * 0.01,
                                    ),
                                    const Text(
                                      'Prepare Time',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
