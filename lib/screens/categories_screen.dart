import 'package:discover_trips/widgets/category_item.dart';
import 'package:flutter/material.dart';

import '../repository/category_repository.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: EdgeInsets.all(10),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 7 / 8,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      children: categoryRepository
          .map(
            (catagoryData) => CategoryItem(
              id: catagoryData.id,
              name: catagoryData.name,
              imageUrl: catagoryData.imageUrl,
            ),
          )
          .toList(),
    );
  }
}
