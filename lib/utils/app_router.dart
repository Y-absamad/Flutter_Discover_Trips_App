import 'package:discover_trips/models/trip.dart';
import 'package:flutter/material.dart';

import '../screens/home_screen.dart';
import '../screens/trip_details_screen.dart';
import '../screens/views/all_trips.dart';
import '../screens/views/categories_screen.dart';
import '../screens/views/favorites_trips.dart';
import '../screens/views/trips_by_category_screen.dart';
import '../viewmodels/favorite_manager.dart';
import '../viewmodels/trips_manager.dart';

class AppRoute {
  static const String homeScreen = '/';
  static const String allTripsScreen = '/allTripsScreen';
  static const String tripsByCategoryScreen = '/tripsByCategoryScreen';
  static const String tripDetailsScreen = '/tripDetailsScreen';
  static const String favoritesScreen = '/favoritesScreen';
  static const String categoriesScreen = '/categoriesScreen';

  static Map<String, WidgetBuilder> getRoutes({
    required List<Trip> favoriteTrips,
    required TripsManager tripsManager,
    required Function(Map<String, bool>) updateFilterChanges,
    required Function(String) updateFavoritesTrips,
    required FavoriteManager favoriteManager,
  }) {
    return {
      homeScreen: (context) => HomeScreen( 
            favoriteTrips: favoriteTrips,
            allTrips: tripsManager.allTris,
            saveFilters: updateFilterChanges,
            currentFilters: tripsManager.currentFilters,
          ),
      allTripsScreen: (context) => AllTripsScreen(
            allTrips: tripsManager.allTris,
          ),
      categoriesScreen: (context) => CategoriesScreen(),
      tripsByCategoryScreen: (context) =>
          TripsByCategoryScreen(allTrips: tripsManager.allTris),
      tripDetailsScreen: (context) => TripDetailsScreen(
            tripsManager: tripsManager,
            changeFavoriteTrips: updateFavoritesTrips,
            isFavorite: favoriteManager.isFavorite,
          ),
      favoritesScreen: (context) =>
          FavoritesScreen(favoriteTrips: favoriteTrips),
    };
  }
}
