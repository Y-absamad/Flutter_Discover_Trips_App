import 'package:flutter/material.dart';
import '../models/trip.dart';
import 'trip_item.dart';

class DisplayTripList extends StatelessWidget {
  final List<Trip> trips;
  final String? emptyMessage;

  const DisplayTripList({
    super.key,
    required this.trips,
    this.emptyMessage,
  });

  @override
  Widget build(BuildContext context) {
    if (trips.isEmpty) {
      return Center(
        child: Text(
          emptyMessage ?? 'لا توجد رحلات متاحة',
          style: Theme.of(context).textTheme.displayLarge,
        ),
      );
    }
    return ListView.builder(
      itemBuilder: (context, index) {
        // check trip and favorite 
        return TripItem(
          imageUrl: trips[index].imageUrl,
          name: trips[index].name,
          informaion: trips[index].informaion,
          tripType: trips[index].tripType,
          season: trips[index].season,
          id: trips[index].id,
        );
      },
      itemCount: trips.length,
    );
  }
}
