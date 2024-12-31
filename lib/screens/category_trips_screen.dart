// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import '../widgets/trip_item.dart';
import '../models/trip.dart';

class CategoryTripsScreen extends StatefulWidget {
  final List<Trip> availableTrips;
  const CategoryTripsScreen({super.key, required this.availableTrips});

  @override
  State<CategoryTripsScreen> createState() => _CategoryTripsScreenState();
}

class _CategoryTripsScreenState extends State<CategoryTripsScreen> {
  late String categoryTitel;
  late List<Trip> displayTrips;

  @override
  void didChangeDependencies() {
    final argument =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;

    final String categoryId = argument['id']!;

    categoryTitel = argument['name']!;

    displayTrips = widget.availableTrips.where((trip) {
      return trip.categories.contains(categoryId);
    }).toList();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            categoryTitel,
            style: Theme.of(context).textTheme.headlineLarge,
          ),
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return TripItem(
              imageUrl: displayTrips[index].imageUrl,
              name: displayTrips[index].name,
              duration: displayTrips[index].duration,
              tripType: displayTrips[index].tripType,
              season: displayTrips[index].season,
              id: displayTrips[index].id,
            );
          },
          itemCount: displayTrips.length,
        ),
      ),
    );
  }
}
