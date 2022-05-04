import 'package:flutter/material.dart';

import '../image_utils.dart';

/// FixBox Image.network

class MyNetworkImage extends StatelessWidget {
  const MyNetworkImage({Key? key, required this.mediaLink}) : super(key: key);

  final String? mediaLink;

  @override
  Widget build(BuildContext context) {
    return () {
      if (mediaLink == null || mediaLink == "") {
        return const Icon(Icons.fastfood, size: 40);
      }
      return ImageUtils.imageFromBase64String(mediaLink!);
    }();
  }
}
