import 'package:discover_trips/utils/app_router.dart';
import 'package:discover_trips/widgets/display_cached_network_image.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final int id;
  final String name;
  final String imageUrl;
  const CategoryItem({
    super.key,
    required this.id,
    required this.name,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(
          AppRoute.tripsByCategoryScreen,
          arguments: {'id': id, 'name': name},
        );
      },
      borderRadius: BorderRadius.circular(15),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: displayCachedNetworkImage(
              imageUrl: imageUrl,
              height: 250,
              width: 200,
            ),
          ),
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.black.withAlpha(100),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Center(
              child: Text(
                name,
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
