import '../models/trip.dart';

class FavoriteManager {
  final List<Trip> allTrips;
  final List<Trip> favoriteTrips;

  FavoriteManager({required this.favoriteTrips, required this.allTrips});

  bool isFavorite(String id) {
    return favoriteTrips.any((trip) => trip.id == id);
  }

  int tripIndex(String id) {
    return favoriteTrips.indexWhere((trip) => trip.id == id);
  }

  void removeTrip(int index) {
    favoriteTrips.removeAt(index);
  }

  void addTrip(String id) {
    favoriteTrips.add(allTrips.firstWhere((trip) => trip.id == id));
  }

  void updateFavoritesTrips(String tripId) {
    final int index = tripIndex(tripId);
    if (index >= 0) {
      removeTrip(index);
    } else {
      addTrip(tripId);
    }
  }
}
