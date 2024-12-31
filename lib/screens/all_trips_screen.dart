import 'package:discover_trips/models/trip.dart';
import 'package:flutter/material.dart';

import '../widgets/trip_item.dart';

class AllTripsScreen extends StatelessWidget {
  final List<Trip> allTrips;
  const AllTripsScreen({super.key, required this.allTrips});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
          itemBuilder: (context, index) {
            return TripItem(
              imageUrl: allTrips[index].imageUrl,
              name: allTrips[index].name,
              duration: allTrips[index].duration,
              tripType: allTrips[index].tripType,
              season: allTrips[index].season,
              id: allTrips[index].id,
            );
          },
          itemCount: allTrips.length,
        );
  }
}