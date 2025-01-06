import '../models/trip.dart';
import '../repository/trip_repository.dart';

class TripsManager {
  late List<Trip> _allTrips;
  late final TripRepository _tripRepository;

  Map<String, bool> _currentFilters = {
    'summer': false,
    'winter': false,
    'family': false,
  };

  TripsManager({required allTrips, required TripRepository tripRepository}) {
    _tripRepository = tripRepository;
    _allTrips = allTrips;
  }

  Map<String, bool> get currentFilters => _currentFilters;

  List<Trip> get allTris => _allTrips;

  void saveCurrentFilters(Map<String, bool> filterData) {
    _currentFilters = filterData;
  }

  List<Trip> getFilteredTrips() {
    return _tripRepository.fetchAllTrips.where((trip) {
      if (_currentFilters['summer'] == true && trip.isInSummer != true) {
        return false;
      }
      if (_currentFilters['winter'] == true && trip.isInWinter != true) {
        return false;
      }
      if (_currentFilters['family'] == true && trip.isForFamilies != true) {
        return false;
      }
      return true;
    }).toList();
  }

  void updateFilterChanges(Map<String, bool> filterData) {
    saveCurrentFilters(filterData);
    _allTrips = getFilteredTrips();
  }

  Trip getTrip(int id) {
    return _allTrips.firstWhere((trip) => id == trip.id);
  }
}
