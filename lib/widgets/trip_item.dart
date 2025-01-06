import 'package:flutter/material.dart';
import '../utils/app_router.dart';

class TripItem extends StatelessWidget {
  final int id;
  final String imageUrl;
  final String name;
  final String informaion;
  final String tripType;
  final String season;
  const TripItem({
    super.key,
    required this.id,
    required this.imageUrl,
    required this.name,
    required this.informaion,
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
        elevation: 10,
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                  height: 250,
                  alignment: Alignment.bottomRight,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withValues(alpha: 0),
                        Colors.black.withValues(alpha: 0.6),
                      ],
                      stops: [0.75, 1],
                    ),
                  ),
                  child: Text(
                    name,
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Row(
                  //   spacing: 6,
                  //   children: [
                  //     Icon(Icons.today, color: Colors.amber),
                  //     Text('$duration أيام'),
                  //   ],
                  // ),
                  Row(
                    spacing: 6,
                    children: [
                      Icon(Icons.sunny, color: Colors.amber),
                      Text(season),
                    ],
                  ),
                  Row(
                    spacing: 6,
                    children: [
                      Icon(Icons.family_restroom, color: Colors.amber),
                      Text(tripType),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}



// import 'package:discover_trips/models/trip.dart';
// import 'package:flutter/material.dart';

// class TripItem extends StatelessWidget {
//   final String tripId;
//   //final List<Trip> listOfTrip;
//   const TripItem({super.key, required this.tripId});

//   @override
//   Widget build(BuildContext context) {
//      return InkWell(
//       splashColor: Colors.black12,
//       onTap: () => selectedTrip(context),
//       child: Card(
//         margin: EdgeInsets.all(10),
//         elevation: 10,
//         child: Column(
//           children: [
//             Stack(
//               children: [
//                 ClipRRect(
//                   borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(15),
//                     topRight: Radius.circular(15),
//                   ),
//                   child: Image.network(
//                     imageUrl,
//                     height: 250,
//                     width: double.infinity,
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//                 Container(
//                   padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
//                   height: 250,
//                   alignment: Alignment.bottomRight,
//                   decoration: BoxDecoration(
//                     gradient: LinearGradient(
//                       begin: Alignment.topCenter,
//                       end: Alignment.bottomCenter,
//                       colors: [
//                         Colors.black.withValues(alpha: 0),
//                         Colors.black.withValues(alpha: 0.6),
//                       ],
//                       stops: [0.75, 1],
//                     ),
//                   ),
//                   child: Text(
//                     name,
//                     style: Theme.of(context).textTheme.headlineLarge,
//                   ),
//                 ),
//               ],
//             ),
//             Padding(
//               padding: const EdgeInsets.all(20.0),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   // Row(
//                   //   spacing: 6,
//                   //   children: [
//                   //     Icon(Icons.today, color: Colors.amber),
//                   //     Text('$duration أيام'),
//                   //   ],
//                   // ),
//                   Row(
//                     spacing: 6,
//                     children: [
//                       Icon(Icons.sunny, color: Colors.amber),
//                       Text(listOfTrip[] seasonText),
//                     ],
//                   ),
//                   Row(
//                     spacing: 6,
//                     children: [
//                       Icon(Icons.family_restroom, color: Colors.amber),
//                       Text(typeText),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }