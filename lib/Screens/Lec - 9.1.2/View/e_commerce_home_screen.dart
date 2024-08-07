import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../Utils/globals.dart';
import '../Provider/e_commerce_home_provider.dart';
import '../Provider/e_commerce_provider.dart';

class ECommerceHomeScreen extends StatelessWidget {
  const ECommerceHomeScreen({super.key});

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
              return Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          radius: 22,
                          backgroundImage: AssetImage('assets/profile.png'),
                        ),
                        Text(
                          'Products',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        Icon(Icons.tune),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.04,
                    ),
                    TextField(
                      onChanged: (value) {
                        homeProviderFalse.searchProducts(value);
                      },
                      cursorColor: Colors.white,
                      controller: txtEcommerceSearch,
                      decoration: InputDecoration(
                        suffixIcon: GestureDetector(
                          onTap: () {
                            homeProviderFalse.removeSearch();
                          },
                          child: const Icon(Icons.close),
                        ),
                        labelText: 'Search',
                        labelStyle: const TextStyle(color: Colors.white),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            width: 2,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          bannerMethod(
                            height: height,
                            width: width,
                            img:
                            'https://www.bointernational.net/wp-content/uploads/2024/01/Promotions-Discounts-600x300.jpg',
                          ),
                          bannerMethod(
                            height: height,
                            width: width,
                            img:
                            'https://img.freepik.com/premium-psd/horizontal-website-banne_451189-109.jpg',
                          ),
                          bannerMethod(
                            height: height,
                            width: width,
                            img:
                            'https://pharmeco.in/wp-content/uploads/2023/05/pharmeco-sub-banner-3-1.png',
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    Expanded(
                      flex: 2,
                      child: ListView.builder(
                        itemCount: ecommerceProviderTrue
                            .eCommerceModal!.products.length,
                        itemBuilder: (context, index) => GestureDetector(
                          onTap: () {
                            ecommerceSelectedIndex = index;
                            Navigator.of(context).pushNamed('/detailE');
                          },
                          child: Card(
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              width: width,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                children: [
                                  SizedBox(
                                    height: height * 0.15,
                                    child: Image.network(ecommerceProviderTrue
                                        .eCommerceModal!
                                        .products[index]
                                        .thumbnail),
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        width: width * 0.45,
                                        child: Text(
                                          ecommerceProviderTrue.eCommerceModal!
                                              .products[index].title,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: width * 0.45,
                                        child: Text(
                                          'Price:- \$${ecommerceProviderTrue.eCommerceModal!.products[index].price}',
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: width * 0.45,
                                        child: Text(
                                            'Category:- ${ecommerceProviderTrue.eCommerceModal!.products[index].category}'),
                                      ),
                                      SizedBox(
                                        width: width * 0.45,
                                        child: Text(
                                            'Rating:- ${ecommerceProviderTrue.eCommerceModal!.products[index].rating}'),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
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

  Container bannerMethod(
      {required double height, required double width, required String img}) {
    return Container(
      margin: const EdgeInsets.only(top: 20, right: 10),
      height: height * 0.18,
      width: width * 0.8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(
            img,
          ),
        ),
      ),
    );
  }
}
