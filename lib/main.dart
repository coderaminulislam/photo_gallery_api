import 'package:flutter/material.dart';
import 'package:photo_gallery_api_assiantment/product_list_screen.dart';

void main() {
  runApp(const PhotoGallery());
}

class PhotoGallery extends StatelessWidget {
  const PhotoGallery({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
      theme: ThemeData(
          appBarTheme: const AppBarTheme(
              backgroundColor: Color(0xff2196F3),
              foregroundColor: Colors.white,
              shadowColor: Colors.black,
              elevation: 5)),
    );
  }
}
