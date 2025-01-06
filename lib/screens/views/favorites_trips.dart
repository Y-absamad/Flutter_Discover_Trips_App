//import 'package:discover_trips/widgets/display_trip_list.dart';
import 'package:discover_trips/widgets/favorite_card_item.dart';

import '../../models/trip.dart';
import 'package:flutter/material.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Trip> favoriteTrips;
  const FavoritesScreen({super.key, required this.favoriteTrips});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return FavoriteCardItem(
          imageUrl: favoriteTrips[index].imageUrl,
          name: favoriteTrips[index].name,
          location: favoriteTrips[index].loction,
          tripType: favoriteTrips[index].tripType,
          season: favoriteTrips[index].season,
          id: favoriteTrips[index].id,
          informaion: favoriteTrips[index].informaion,
        );
      },
      itemCount: favoriteTrips.length,
    );
  }
}
