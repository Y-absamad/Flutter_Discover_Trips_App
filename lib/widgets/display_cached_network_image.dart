import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

Widget displayCachedNetworkImage(
    {required String imageUrl, required double height, required double width}) {
  return CachedNetworkImage(
    imageUrl: imageUrl,
    placeholder: (context, url) => Center(
      child: SizedBox(
        height: 30,
        width: 30,
        child: CircularProgressIndicator(),
      ),
    ),
    errorWidget: (context, url, error) => Icon(Icons.error),
    height: height,
    width: width,
    fit: BoxFit.cover,
  );
}
