import 'package:discover_trips/widgets/display_trip_list.dart';

import '../../models/trip.dart';
import 'package:flutter/material.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Trip> favoriteTrips;
  const FavoritesScreen({super.key, required this.favoriteTrips});

  @override
  Widget build(BuildContext context) {
    return DisplayTripList(
      trips: favoriteTrips,
      emptyMessage: 'لا توجد رحلات مفضلة بعد ',
    );
  }
}
