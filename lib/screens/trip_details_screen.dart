import 'package:discover_trips/viewmodels/trips_manager.dart';
import 'package:discover_trips/widgets/display_cached_network_image.dart';
import 'package:discover_trips/widgets/tripDetails/list_view_container.dart';
import 'package:flutter/material.dart';
import '../models/trip.dart';
import '../widgets/tripDetails/display_image.dart';
import '../widgets/tripDetails/section_titel.dart';
import '../widgets/tripDetails/trip_status_card.dart';
import '../widgets/trip_info_card.dart';

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
    final bool isFavorite = widget.isFavorite(tripId);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              DisplayImage(imageUrl: selectedTrip.imageUrl),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SectionTitel(sectionTitel: selectedTrip.name),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: IconButton(
                      onPressed: () {
                        widget.changeFavoriteTrips(tripId);
                      },
                      icon: Icon(
                        isFavorite ? Icons.favorite : Icons.favorite_border,
                        color: isFavorite ? Colors.red : Colors.black45,
                        size: 45,
                        shadows: [
                          BoxShadow(
                            color: Colors.blueGrey,
                            blurRadius: 50,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  selectedTrip.description,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
              SectionTitel(sectionTitel: 'معلومات'),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                    TripInfoCard(
                      textLabel: selectedTrip.loction,
                      iconData: Icons.location_on,
                    ),
                    TripInfoCard(
                      textLabel: selectedTrip.tripType,
                      iconData: Icons.airplanemode_active,
                    ),
                    TripInfoCard(
                      textLabel: selectedTrip.season,
                      iconData: Icons.sunny_snowing,
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TripStatusCard(label: 'صيف', isTrue: selectedTrip.isInSummer),
                  TripStatusCard(
                      label: 'شتاء', isTrue: selectedTrip.isInWinter),
                  TripStatusCard(
                      label: 'للعائلات', isTrue: selectedTrip.isForFamilies),
                ],
              ),
              SectionTitel(sectionTitel: 'الأنشطة'),
              ListViewContainer(
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
      ),
    );
  }
}
