import 'package:discover_trips/viewmodels/trips_manager.dart';
import 'package:discover_trips/widgets/tripDetails/list_view_container.dart';
import 'package:flutter/material.dart';
import '../models/trip.dart';
import '../widgets/tripDetails/section_titel.dart';

class TripDetailsScreen extends StatefulWidget {
  final TripsManager tripsManager;
  final Function changeFavoriteTrips;
  final Function isFavorite;
  const TripDetailsScreen({
    super.key,
    required this.tripsManager,
    required this.changeFavoriteTrips,
    required this.isFavorite,
  });

  @override
  State<TripDetailsScreen> createState() => _TripDetailsScreenState();
}

class _TripDetailsScreenState extends State<TripDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final tripId = ModalRoute.of(context)!.settings.arguments as int;
    final Trip selectedTrip = widget.tripsManager.getTrip(tripId);

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
            //widget.isFavorite(tripId) ? Icons.favorite : Icons.favorite_border,
            widget.isFavorite(tripId) ? Icons.favorite : Icons.favorite_border,
          ),
          onPressed: () {
            widget.changeFavoriteTrips(tripId);
            // setState(() {
            //   widget.favoriteManager.updateFavoritesTrips(tripId);
            // });
          },
        ),
      ),
    );
  }
}
