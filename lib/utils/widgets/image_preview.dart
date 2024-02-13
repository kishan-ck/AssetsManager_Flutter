import 'package:flutter/material.dart';

class FullScreenImage extends StatelessWidget {
  final List<String> imageUrls;
  const FullScreenImage({super.key, required this.imageUrls});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Restaurant"),),
      body: PageView.builder(
        itemCount: imageUrls.length,
        itemBuilder: (context, index) {
          return Image.asset(
            imageUrls[index],
            alignment: Alignment.center,
            // fit: BoxFit.fill,
            height: double.infinity,
            width: double.infinity,
          );
        },
      ),
    );
  }
}
