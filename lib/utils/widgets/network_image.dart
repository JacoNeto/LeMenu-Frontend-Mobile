import 'package:flutter/material.dart';

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
      return Image.network(
        '$mediaLink',
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) {
            return child;
          }
          return Center(
            child: CircularProgressIndicator(
              value: loadingProgress.expectedTotalBytes != null
                  ? loadingProgress.cumulativeBytesLoaded /
                      loadingProgress.expectedTotalBytes!
                  : null,
            ),
          );
        },
      );
    }();
  }
}
