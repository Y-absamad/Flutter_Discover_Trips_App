import 'package:flutter/material.dart';

import '../display_cached_network_image.dart';

class DisplayImage extends StatelessWidget {
  final String imageUrl;

  const DisplayImage({
    super.key,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 320,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(30),
          bottomLeft: Radius.circular(30),
        ),
        boxShadow: [BoxShadow(blurRadius: 10, color: Colors.white30)],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(30), bottomLeft: Radius.circular(30)),
        // child: Image.network(
        //   imageUrl,
        //   fit: BoxFit.cover,
        // ),
        child: displayCachedNetworkImage(imageUrl: imageUrl, height: 320, width: double.infinity),
      ),
    );
  }
}

