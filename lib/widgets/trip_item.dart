import 'package:discover_trips/widgets/display_cached_network_image.dart';
import 'package:flutter/material.dart';

import '../utils/app_router.dart';
import 'trip_info_card.dart';

class TripItem extends StatelessWidget {
  final int id;
  final String imageUrl;
  final String name;
  final String description;
  final String tripType;
  final String season;
  final String location;
  const TripItem({
    super.key,
    required this.id,
    required this.imageUrl,
    required this.name,
    required this.description,
    required this.tripType,
    required this.season,
    required this.location,
  });

  void selectedTrip(BuildContext context) {
    Navigator.of(context).pushNamed(
      AppRoute.tripDetailsScreen,
      arguments: id,
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.black12,
      onTap: () => selectedTrip(context),
      child: Card(
        margin: EdgeInsets.all(10),
        elevation: 20,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(15),
                bottomRight: Radius.circular(15),
              ),
            child: displayCachedNetworkImage(imageUrl: imageUrl, height: 200, width: 150),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  spacing: 6,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    Text(
                      description,
                      style:
                          Theme.of(context).textTheme.headlineSmall!.copyWith(
                                fontSize: 14,
                              ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    TripInfoCard(
                      textLabel: location,
                      iconData: Icons.location_on,
                    ),
                    TripInfoCard(
                      textLabel: season,
                      iconData: Icons.sunny_snowing,
                    ),
                    TripInfoCard(
                      textLabel: tripType,
                      iconData: Icons.airplanemode_active,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

