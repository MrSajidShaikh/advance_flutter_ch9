import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../Utils/globals.dart';
import '../Provider/e_commerce_cart_provider.dart';
import '../provider/e_commerce_provider.dart';

class ECommerceCartScreen extends StatelessWidget {
  const ECommerceCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    var ecommerceCartProviderFalse =
    Provider.of<ECommerceCartProvider>(context, listen: false);
    var ecommerceCartProviderTrue =
    Provider.of<ECommerceCartProvider>(context, listen: true);
    var ecommerceProviderFalse =
    Provider.of<ECommerceProvider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder(
          future: ecommerceProviderFalse.fromApi(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          radius: 22,
                          backgroundImage: AssetImage('assets/profile.jpeg'),
                        ),
                        Text(
                          'Cart',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Icon(Icons.notifications),
                      ],
                    ),
                    ...List.generate(
                      cartList.length,
                          (index) => cartContainer(
                        height: height,
                        width: width,
                        ecommerceCartProviderFalse: ecommerceCartProviderFalse,
                        index: index,
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
        bottomNavigationBar: BottomAppBar(
          child: GestureDetector(
            onTap: () {
              ecommerceCartProviderFalse.discountedPrice();
              ecommerceCartProviderFalse.totalPrice();
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return SizedBox(
                    height: height * 0.25,
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Price',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            '${ecommerceCartProviderTrue.discount}',
                            style: const TextStyle(
                              fontSize: 18,
                              decoration: TextDecoration.lineThrough,
                              decorationThickness: 2,
                            ),
                          ),
                          const Text(
                            'Discounted Price',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            '${ecommerceCartProviderTrue.price}',
                            style: const TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          const Spacer(),
                          Container(
                            alignment: Alignment.center,
                            height: height * 0.07,
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
                            child: Text(
                              'Pay ${ecommerceCartProviderTrue.price}',
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
            child: Container(
              alignment: Alignment.center,
              height: height * 0.07,
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
              child: const Text(
                'Place Order',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Card cartContainer({
    required double height,
    required double width,
    required ECommerceCartProvider ecommerceCartProviderFalse,
    required int index,
  }) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(10),
        height: height * 0.2,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Image.network(cartList[index].thumbnail),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    ecommerceCartProviderFalse.removeFromCart(index);
                  },
                  child: const Icon(Icons.delete),
                ),
                SizedBox(
                  height: height * 0.0018,
                ),
                SizedBox(
                  width: width * 0.5,
                  child: Text(
                    cartList[index].title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
                SizedBox(
                  width: width * 0.5,
                  child: Text(
                    '\$${cartList[index].price}',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  height: height * 0.05,
                  width: width * 0.2,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          ecommerceCartProviderFalse.removeQty(index);
                        },
                        child: const Icon(Icons.remove),
                      ),
                      Text(qty[index].toString()),
                      GestureDetector(
                        onTap: () {
                          ecommerceCartProviderFalse.addQty(index);
                        },
                        child: const Icon(Icons.add),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
