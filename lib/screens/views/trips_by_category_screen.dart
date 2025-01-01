// // ignore_for_file: unused_local_variable

// import 'package:discover_trips/widgets/display_trip_list.dart';
// import 'package:flutter/material.dart';
// import '../../models/trip.dart';

// class TripsByCategoryScreen extends StatefulWidget {
//   final List<Trip> allTrips;
//   const TripsByCategoryScreen({super.key, required this.allTrips});

//   @override
//   State<TripsByCategoryScreen> createState() => _TripsByCategoryScreenState();
// }

// class _TripsByCategoryScreenState extends State<TripsByCategoryScreen> {
//   late String categoryTitel;
//   late List<Trip> displayTrips;

//   @override
//   void didChangeDependencies() {
//     final argument = ModalRoute.of(context)!.settings.arguments as Map<String, String>;
//     final String categoryId = argument['id']!;
//     categoryTitel = argument['name']!;
//     displayTrips = widget.allTrips.where((trip) {
//       return trip.categories.contains(categoryId);
//     }).toList();

//     super.didChangeDependencies();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text(
//             categoryTitel,
//             style: Theme.of(context).textTheme.headlineLarge,
//           ),
//         ),
//         body: DisplayTripList(trips: displayTrips),
//       ),
//     );
//   }
// }

import 'package:discover_trips/widgets/display_trip_list.dart';
import 'package:flutter/material.dart';
import '../../models/trip.dart';

class TripsByCategoryScreen extends StatelessWidget {
  final List<Trip> allTrips;
  const TripsByCategoryScreen({super.key, required this.allTrips});

  @override
  Widget build(BuildContext context) {
    final argument = ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final String categoryId = argument['id']!;
    final String categoryTitle = argument['name']!;

    final displayTrips = allTrips.where((trip) {
      return trip.categories.contains(categoryId);
    }).toList();

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