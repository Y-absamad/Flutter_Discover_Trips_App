import 'package:discover_trips/viewmodels/category_manager.dart';
import 'package:discover_trips/widgets/display_trip_list.dart';
import 'package:flutter/material.dart';
import '../../models/trip.dart';

class TripsByCategoryScreen extends StatelessWidget {
  final CategoryManager categoryManager;
  final List<Trip> allTrips;
  const TripsByCategoryScreen({super.key, required this.categoryManager , required this.allTrips});

  @override
  Widget build(BuildContext context) {
    final argument = ModalRoute.of(context)!.settings.arguments as Map<String, Object>;
    final int categoryId = argument['id']! as int;
    final String categoryTitle = argument['name']! as String;
    List<Trip> displayTrips = categoryManager.getTripsByCategory(categoryId , allTrips);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            categoryTitle,
            style: Theme.of(context).textTheme.headlineLarge,
          ),
        ),
        body: DisplayTripList(trips: displayTrips),
      ),
    );
  }
}