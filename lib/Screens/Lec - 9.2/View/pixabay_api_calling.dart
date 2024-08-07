import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../Utils/globals.dart';
import '../Modal/pixabay_api_modal.dart';
import '../Provider/pixabay_api_provider.dart';

class PixabayApi extends StatelessWidget {
  const PixabayApi({super.key});

  @override
  Widget build(BuildContext context) {
    var pixabayApiProviderFalse =
    Provider.of<PixabayApiProvider>(context, listen: false);
    var pixabayApiProviderTrue =
    Provider.of<PixabayApiProvider>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: const Icon(
          Icons.account_circle_outlined,
          size: 30,
        ),
        scrolledUnderElevation: 0.1,
        title: Expanded(
          child: TextField(
            onChanged: (value) {
              pixabayApiProviderFalse.searchImage(value);
            },
            controller: txtSearch,
            cursorColor: Colors.black,
            decoration: InputDecoration(
              suffixIcon: GestureDetector(
                onTap: () {
                  pixabayApiProviderFalse.clearSearch();
                },
                child: const Icon(Icons.close),
              ),
              prefixIcon: const Icon(Icons.search),
              hintText: 'Search Images',
              hintStyle: const TextStyle(color: Colors.grey),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: Colors.black,
                  width: 1,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: Colors.black,
                  width: 1,
                ),
              ),
            ),
          ),
        ),
      ),
      body: FutureBuilder(
        future: Provider.of<PixabayApiProvider>(context, listen: false)
            .fromApi(pixabayApiProviderTrue.search),
        builder: (context, snapshot) {
          PixabayApiModal? apiModal = snapshot.data;
          if (snapshot.hasData) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: pixabayApiProviderTrue.pixabayApiModal!.hits.length,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    pixaBaySelectedIndex = index;
                    Navigator.of(context).pushNamed('/detailP');
                  },
                  child: Container(
                    height: 300,
                    width: double.infinity,
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(apiModal!.hits[index].webFormatURL),
                      ),
                    ),
                  ),
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
}