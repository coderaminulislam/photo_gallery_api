import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:photo_gallery_api_assiantment/product_class.dart';
import 'package:photo_gallery_api_assiantment/product_details_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Product> productList = [];
  bool _getProductListInProgress = false;
  @override
  void initState() {
    super.initState();
    _addImageList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Photo Gallery App',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Visibility(
            visible: _getProductListInProgress == false,
            replacement: const Center(
              child: CircularProgressIndicator(),
            ),
            child: ListView.builder(
              itemCount: productList.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return _buildProductItem(productList[index]);
              },
            ),
          )),
    );
  }

  Widget _buildProductItem(Product product) {
    return Column(
      children: [
        Row(
          children: [
            GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PhotoDetails(
                          product: product,
                        ),
                      ));
                },
                child: SizedBox(
                  width: 110,
                  height: 110,
                  child: Image.network(product.thumbnailUrl),
                )),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                product.title,
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    color: Colors.black.withOpacity(.8)),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        )
      ],
    );
  }

  Future<void> _addImageList() async {
    _getProductListInProgress = true;
    setState(() {});

    const String addImageUrl = 'https://jsonplaceholder.typicode.com/photos';
    Uri uri = Uri.parse(addImageUrl);
    Response response = await get(uri);
    final jsonProductList = jsonDecode(response.body);


    if (response.statusCode == 200) {
      for (Map<String, dynamic> item in jsonProductList) {
        Product product = Product(
            id: item['id'] ?? '',
            albumId: item['albumId'] ?? '',
            url: item['url'] ?? '',
            thumbnailUrl: item['thumbnailUrl'] ?? '',
            title: item['title'] ?? 'Unknown');
        productList.add(product);
      }
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Product List Failed!')));
    }
    _getProductListInProgress = false;
    setState(() {});
  }
}
