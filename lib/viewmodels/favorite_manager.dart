import '../models/trip.dart';

class FavoriteManager {
  final List<Trip> allTrips;
  final List<Trip> favoriteTrips;

  FavoriteManager({required this.favoriteTrips, required this.allTrips});

  bool isFavorite(int id) {
    return favoriteTrips.any((trip) => trip.id == id);
  }

  int tripIndex(int id) {
    return favoriteTrips.indexWhere((trip) => trip.id == id);
  }

  void removeTrip(int index) {
    favoriteTrips.removeAt(index);
  }

  void addTrip(int id) {
    favoriteTrips.add(allTrips.firstWhere((trip) => trip.id == id));
  }

  void updateFavoritesTrips(int tripId) {
    final int index = tripIndex(tripId);
    if (index >= 0) {
      removeTrip(index);
    } else {
      addTrip(tripId);
    }
  }
}
