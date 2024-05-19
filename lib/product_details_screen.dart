import 'package:flutter/material.dart';
import 'package:photo_gallery_api_assiantment/product_class.dart';

class PhotoDetails extends StatelessWidget {
  final Product product;
  const PhotoDetails({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Photo Details',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(product.url),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Title: ${product.title}',
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  color: Colors.black),
            ),
            const SizedBox(
              height: 20,
            ),
            Text('ID:${product.id}',
                style: const TextStyle(
                  fontSize: 16,
                ))
          ],
        ),
      ),
    );
  }
}
