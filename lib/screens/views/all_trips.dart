import 'package:discover_trips/models/trip.dart';
import 'package:discover_trips/widgets/display_trip_list.dart';
import 'package:flutter/material.dart';

class AllTripsScreen extends StatelessWidget {
  final List<Trip> allTrips;
  const AllTripsScreen({super.key, required this.allTrips});

  @override
  Widget build(BuildContext context) {
    return DisplayTripList(trips: allTrips);
  }
}
