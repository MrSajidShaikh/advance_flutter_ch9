import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../Utils/globals.dart';
import '../Provider/pixabay_api_provider.dart';

class DetailScreenPixabay extends StatelessWidget {
  const DetailScreenPixabay({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var pixabayApiProviderFalse =
    Provider.of<PixabayApiProvider>(context, listen: false);
    var pixabayApiProviderTrue =
    Provider.of<PixabayApiProvider>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: const Icon(Icons.account_circle_outlined),
        title: const Text('Details'),
      ),
      body: FutureBuilder(
        future: pixabayApiProviderFalse.fromApi(pixabayApiProviderTrue.search),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: height * 0.45,
                    width: width,
                    child: Image.network(
                      pixabayApiProviderTrue.pixabayApiModal!
                          .hits[pixaBaySelectedIndex].webFormatURL,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Row(
                    children: [
                      Text(
                        pixabayApiProviderTrue
                            .pixabayApiModal!.hits[pixaBaySelectedIndex].id
                            .toString(),
                        style: const TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      const Spacer(),
                      const Icon(Icons.favorite_border),
                      SizedBox(
                        width: width * 0.01,
                      ),
                      Text(
                        pixabayApiProviderTrue
                            .pixabayApiModal!.hits[pixaBaySelectedIndex].likes
                            .toString(),
                        style: const TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Text(
                    'Downloads: ${pixabayApiProviderTrue.pixabayApiModal!.hits[pixaBaySelectedIndex].downloads}',
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Text(
                    'Views: ${pixabayApiProviderTrue.pixabayApiModal!.hits[pixaBaySelectedIndex].views}',
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      pixabayApiProviderFalse.setWallpaper(
                          pixabayApiProviderTrue.pixabayApiModal!
                              .hits[pixaBaySelectedIndex].webFormatURL);
                      const SnackBar(
                        content: Text('Wallpaper set successfully'),
                      );
                    },
                    child: Container(
                      alignment: Alignment.center,
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
                      child: const Text(
                        'Set Wallpaper',
                        style: TextStyle(
                          fontSize: 20,
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
    );
  }
}