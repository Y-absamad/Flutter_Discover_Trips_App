import 'package:discover_trips/repository/category_repository.dart';
import 'package:discover_trips/utils/app_theme_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import '../viewmodels/favorite_manager.dart';
import '../viewmodels/trips_manager.dart';
import '../models/trip.dart';
import '../utils/app_router.dart';
import '../repository/trip_repository.dart';
import 'viewmodels/category_manager.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final TripRepository _tripRepository = TripRepository();
  final CategoryRepository _categoryRepository = CategoryRepository();
  late TripsManager _tripsManager;
  late CategoryManager _categoryManager;
  late List<Trip> tripsData;
  late final FavoriteManager _favoriteManager;
  final List<Trip> _favoriteTrips = [];

  @override
  void initState() {
    super.initState();
    tripsData = _tripRepository.fetchAllTrips;
    _tripsManager =
        TripsManager(allTrips: tripsData, tripRepository: _tripRepository);
    _favoriteManager =
        FavoriteManager(favoriteTrips: _favoriteTrips, allTrips: tripsData);
    _categoryManager = CategoryManager(categoryRepository: _categoryRepository);
  }

  void _updateFilterChanges(Map<String, bool> filterData) {
    setState(() {
      _tripsManager.updateFilterChanges(filterData);
    });
  }

  void _updateFavoritesTrips(int tripId) {
    setState(() {
      _favoriteManager.updateFavoritesTrips(tripId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Discover Trips',
      theme: appthemeData(),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('ar', 'AE'),
      ],
      initialRoute: AppRoute.homeScreen,
      routes: AppRoute.getRoutes(
        favoriteTrips: _favoriteTrips,
        tripsManager: _tripsManager,
        updateFilterChanges: _updateFilterChanges,
        updateFavoritesTrips: _updateFavoritesTrips,
        favoriteManager: _favoriteManager,
        categoryManager: _categoryManager,
      ),
    );
  }
}
