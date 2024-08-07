import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../Utils/globals.dart';
import '../provider/e_commerce_home_provider.dart';
import '../provider/e_commerce_provider.dart';

class ECommerceDetailScreen extends StatelessWidget {
  const ECommerceDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var ecommerceProviderFalse =
    Provider.of<ECommerceProvider>(context, listen: false);
    var ecommerceProviderTrue =
    Provider.of<ECommerceProvider>(context, listen: true);
    var homeProviderFalse =
    Provider.of<ECommerceHomeProvider>(context, listen: false);
    var homeProviderTrue =
    Provider.of<ECommerceHomeProvider>(context, listen: true);
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder(
          future: ecommerceProviderFalse.fromApi(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: height * 0.35,
                      child: Image.network(ecommerceProviderTrue.eCommerceModal!
                          .products[ecommerceSelectedIndex].thumbnail),
                    ),
                    Card(
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        width: width,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              ecommerceProviderTrue.eCommerceModal!
                                  .products[ecommerceSelectedIndex].title,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: height * 0.01,
                            ),
                            Text(
                              'Price: \$${ecommerceProviderTrue.eCommerceModal!.products[ecommerceSelectedIndex].discountPercentage + ecommerceProviderTrue.eCommerceModal!.products[ecommerceSelectedIndex].price}',
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.lineThrough,
                                decorationThickness: 2,
                              ),
                            ),
                            Text(
                              'Discount price: \$${ecommerceProviderTrue.eCommerceModal!.products[ecommerceSelectedIndex].price}',
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: height * 0.01,
                            ),
                            Text(
                              'Category: ${ecommerceProviderTrue.eCommerceModal!.products[ecommerceSelectedIndex].category}',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.grey[400],
                              ),
                            ),
                            Text(
                              ecommerceProviderTrue.eCommerceModal!
                                  .products[ecommerceSelectedIndex].description,
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey[400],
                              ),
                            ),
                            SizedBox(
                              height: height * 0.02,
                            ),
                            const Text(
                              'Reviews:',
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                            Text(
                              ecommerceProviderTrue
                                  .eCommerceModal!
                                  .products[ecommerceSelectedIndex]
                                  .reviews[0]
                                  .reviewerName,
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.grey[400],
                              ),
                            ),
                            Text(
                              'Feedback: ${ecommerceProviderTrue.eCommerceModal!.products[ecommerceSelectedIndex].reviews[0].comment}',
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.grey[400],
                              ),
                            ),
                            SizedBox(
                              height: height * 0.01,
                            ),
                            Text(
                              ecommerceProviderTrue
                                  .eCommerceModal!
                                  .products[ecommerceSelectedIndex]
                                  .reviews[1]
                                  .reviewerName,
                              style: TextStyle(
                                  fontSize: 18, color: Colors.grey[400]),
                            ),
                            Text(
                              'Feedback: ${ecommerceProviderTrue.eCommerceModal!.products[ecommerceSelectedIndex].reviews[1].comment}',
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.grey[400],
                              ),
                            ),
                            SizedBox(
                              height: height * 0.01,
                            ),
                            Text(
                              ecommerceProviderTrue
                                  .eCommerceModal!
                                  .products[ecommerceSelectedIndex]
                                  .reviews[2]
                                  .reviewerName,
                              style: TextStyle(
                                  fontSize: 18, color: Colors.grey[400]),
                            ),
                            Text(
                              'Feedback: ${ecommerceProviderTrue.eCommerceModal!.products[ecommerceSelectedIndex].reviews[2].comment}',
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.grey[400],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                cartList.add(ecommerceProviderTrue
                                    .eCommerceModal!
                                    .products[ecommerceSelectedIndex]);
                                for(int i = 0; i < ecommerceProviderTrue.eCommerceModal!.products.length; i++){
                                  qty.add(1);
                                }
                                Navigator.of(context).pushNamed('/cartE');
                              },
                              child: Container(
                                height: height * 0.08,
                                margin: const EdgeInsets.only(top: 10),
                                width: width,
                                decoration: BoxDecoration(
                                  color: Colors.white10,
                                  borderRadius: BorderRadius.circular(40),
                                  boxShadow: const [
                                    BoxShadow(
                                      spreadRadius: 1,
                                      blurRadius: 2,
                                      color: Colors.black,
                                    ),
                                  ],
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(Icons.add_shopping_cart),
                                    SizedBox(
                                      width: width * 0.04,
                                    ),
                                    const Text(
                                      'Add to cart',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
