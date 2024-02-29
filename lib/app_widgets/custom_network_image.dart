import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomNetworkImage extends StatelessWidget {
  final String image;
  final double? width;
  final double? height;

  const CustomNetworkImage({
    Key? key,
    required this.image,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: image,
      width: width,
      height: height,
      fit: BoxFit.cover,
      placeholder: (context, url) => Image.asset(
        "assets/icon/image.png",
      ),
      errorWidget: (context, url, error) => Image.asset(
        "assets/icon/image.png",
      ),
    );
  }
}
