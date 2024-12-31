import 'package:discover_trips/widgets/tripDetails/list_view_container.dart';
import 'package:flutter/material.dart';
import '../models/trip.dart';
import '../widgets/tripDetails/section_titel.dart';
import '../repository/trip_repository.dart';

class TripDetailsScreen extends StatelessWidget {
  final Function manageFavorite;
  final Function isFavorite;
  const TripDetailsScreen(
      {super.key,
      required this.manageFavorite,
      required this.isFavorite,
      });

  @override
  Widget build(BuildContext context) {
    final tripId = ModalRoute.of(context)!.settings.arguments as String;
    final Trip selectedTrip = tripsData.firstWhere((trip) => trip.id == tripId);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            selectedTrip.name,
            style: Theme.of(context).textTheme.headlineLarge,
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 300,
                width: double.infinity,
                child: Image.network(
                  selectedTrip.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              SectionTitel(sectionTitel: 'الأنشطة'),
              ListViewContainer(
                height: selectedTrip.activities.length * 45,
                length: selectedTrip.activities.length,
                itemBuilder: (context, index) => Card(
                  elevation: 0.5,
                  shape: Border.fromBorderSide(BorderSide.none),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Text(
                      selectedTrip.activities[index],
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              SectionTitel(sectionTitel: ' البرنامج اليومي'),
              ListViewContainer(
                height: selectedTrip.program.length * 74,
                length: selectedTrip.program.length,
                itemBuilder: (context, index) => Column(
                  children: [
                    ListTile(
                      title: Text(
                        selectedTrip.program[index],
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                    ),
                    Divider(),
                  ],
                ),
              ),
              SizedBox(height: 50),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(
            isFavorite(tripId) ? Icons.favorite : Icons.favorite_border,
          ),
          onPressed: () {
            manageFavorite(tripId);
          },
        ),
      ),
    );
  }
}
