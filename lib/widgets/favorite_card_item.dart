import 'package:flutter/material.dart';

import '../models/trip.dart';
import '../utils/app_router.dart';

class FavoriteCardItem extends StatelessWidget {
  final String id;
  final String imageUrl;
  final String name;
  final int duration;
  final TripType tripType;
  final Season season;
  const FavoriteCardItem({
    super.key,
    required this.id,
    required this.imageUrl,
    required this.name,
    required this.duration,
    required this.tripType,
    required this.season,
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
        // الصورة على اليمين
        ClipRRect(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(15),
            bottomRight: Radius.circular(15),
          ),
          child: Image.network(
            imageUrl,
            width: 150, // عرض الصورة
            height: 200, // ارتفاع الصورة
            fit: BoxFit.cover,
          ),
        ),
        // المعلومات بجوار الصورة
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // اسم الرحلة
                Text(
                  name,
                  style: Theme.of(context).textTheme.displayLarge!.copyWith(
                    fontSize: 24,
                  ),
                ),
                SizedBox(height: 10),
                // الموقع
                Row(
                  children: [
                    Icon(Icons.location_on, color: Colors.blue, size: 18),
                    SizedBox(width: 5),
                    Text(
                      'الموقع: مصر', // استبدل `location` بمتغير الموقع
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
                SizedBox(height: 10),
                // المدة
                Row(
                  children: [
                    Icon(Icons.today, color: Colors.amber, size: 18),
                    SizedBox(width: 5),
                    Text(
                      '$duration أيام',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
                SizedBox(height: 10),
                // الموسم
                Row(
                  children: [
                    Icon(Icons.sunny, color: Colors.amber, size: 18),
                    SizedBox(width: 5),
                    Text(
                      'الشتاء',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
                SizedBox(height: 10),
                // النوع
                Row(
                  children: [
                    Icon(Icons.family_restroom, color: Colors.amber, size: 18),
                    SizedBox(width: 5),
                    Text(
                      'مغامرة',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
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