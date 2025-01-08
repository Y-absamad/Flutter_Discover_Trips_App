import 'package:discover_trips/models/trip.dart';
import 'package:discover_trips/viewmodels/category_manager.dart';
import 'package:discover_trips/widgets/category_item.dart';
import 'package:flutter/material.dart';


class CategoriesScreen extends StatelessWidget {
  final CategoryManager categoryManager;
  final List<Trip>allTrips;
  const CategoriesScreen({super.key, required this.categoryManager , required this.allTrips});

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
      children: categoryManager.fetchAllCategories
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
