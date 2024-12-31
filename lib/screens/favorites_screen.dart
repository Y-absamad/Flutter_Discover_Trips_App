import '../models/trip.dart';
import 'package:flutter/material.dart';

import '../widgets/trip_item.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Trip> favoriteTrips;
  const FavoritesScreen({super.key, required this.favoriteTrips});

  @override
  Widget build(BuildContext context) {
    return favoriteTrips.isEmpty
        ? Center(
            child: Text(
              'لا يوجد اي رحلات مفضلة',
              style: Theme.of(context).textTheme.displayLarge,
            ),
          )
        : ListView.builder(
            itemBuilder: (context, index) {
              return TripItem(
                imageUrl: favoriteTrips[index].imageUrl,
                name: favoriteTrips[index].name,
                duration: favoriteTrips[index].duration,
                tripType: favoriteTrips[index].tripType,
                season: favoriteTrips[index].season,
                id: favoriteTrips[index].id,
              );
            },
            itemCount: favoriteTrips.length,
          );
  }
}
