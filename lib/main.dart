// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'models/trip.dart';
import 'utils/app_router.dart';
import '../repository/trip_repository.dart';
import '../screens/trip_details_screen.dart';
import '../screens/categories_screen.dart';
import '../screens/category_trips_screen.dart';
//import '../screens/favorites_screen.dart';
import '../screens/filters_screen.dart';
import '../screens/taps_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _currentFilters = {
    'summer': false,
    'winter': false,
    'family': false,
  };

  void saveFilterChanges(Map<String, bool> filterData) {
    setState(() {
      _currentFilters = filterData;
      _availableTrips = tripsData.where((trip) {
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
    });
  }

  void _manageFavorite(String tripId) {
    final int index = _favoriteTrips.indexWhere((trip) => trip.id == tripId);
    if (index >= 0) {
      setState(() {
        _favoriteTrips.removeAt(index);
      });
    } else {
      setState(() {
        _favoriteTrips.add(tripsData.firstWhere((trip) => trip.id == tripId));
      });
    }
  }

  

  bool _isFavorite(String id){
    return _favoriteTrips.any((trip) => trip.id == id);
  }


  List<Trip> _availableTrips = tripsData;
  final List<Trip> _favoriteTrips = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Discover Trips',
      theme: ThemeData(
        primaryColorLight: Colors.blue,
        textTheme: ThemeData.light().textTheme.copyWith(
              headlineMedium: TextStyle(
                color: Colors.blue,
                fontSize: 24,
                fontFamily: 'ELMessiri',
                fontWeight: FontWeight.bold,
              ),
              headlineLarge: TextStyle(
                color: Colors.white,
                fontSize: 26,
                fontFamily: 'ELMessiri',
                fontWeight: FontWeight.bold,
              ),
              headlineSmall: TextStyle(
                color: Colors.blueGrey,
                fontSize: 16,
                fontFamily: 'ELMessiri',
                fontWeight: FontWeight.bold,
              ),
              displaySmall: TextStyle(
                color: Colors.blueGrey,
                fontSize: 12,
                fontFamily: 'ELMessiri',
                fontWeight: FontWeight.bold,
              ),
              displayMedium: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontFamily: 'ELMessiri',
                fontWeight: FontWeight.bold,
              ),
              displayLarge: TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontFamily: 'ELMessiri',
                fontWeight: FontWeight.bold,
              ),
            ),
        appBarTheme: AppBarTheme(color: Colors.blue, centerTitle: true),
      ),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('ar', 'AE'),
      ],
      initialRoute: AppRoute.tapsScreen,
      routes: {
        AppRoute.tapsScreen: (context) =>
            TapsScreen(favoriteTrips: _favoriteTrips),
        AppRoute.categoriesScreen: (context) => CategoriesScreen(),
        AppRoute.categoryTripsScreen: (context) =>
            CategoryTripsScreen(availableTrips: _availableTrips),
        AppRoute.tripDetailsScreen: (context) => TripDetailsScreen(manageFavorite: _manageFavorite , isFavorite: _isFavorite,),
        //AppRoute.favoritesScreen: (context) => FavoritesScreen(favoriteTrips: _favoriteTrips,),
        AppRoute.filtersScreen: (context) => FiltersScreen(
              saveFilters: saveFilterChanges,
              currentFilters: _currentFilters,
            ),
      },
    );
  }
}
