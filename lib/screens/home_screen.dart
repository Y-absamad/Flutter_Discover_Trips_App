import 'package:discover_trips/widgets/home/bottom_navigation_bar.dart';
import 'package:discover_trips/screens/views/all_trips.dart';
import 'package:discover_trips/viewmodels/category_manager.dart';
import 'package:flutter/material.dart';
import '../models/trip.dart';
import 'views/categories_screen.dart';
import '../widgets/drawer/app_drawer.dart';
import 'views/favorites_trips_list.dart';

class HomeScreen extends StatefulWidget {
  final List<Trip> favoriteTrips;
  final List<Trip> allTrips;
  final Function saveFilters;
  final Map<String, bool> currentFilters;
  final CategoryManager categoryManager;
  const HomeScreen({
    super.key,
    required this.favoriteTrips,
    required this.allTrips,
    required this.saveFilters,
    required this.currentFilters,
    required this.categoryManager,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<String> _titles = [
    'تصنيفات الرحلات',
    'جميع الرحلات',
    'الرحلات المفضلة'
  ];

  @override
  Widget build(BuildContext context) {
    Widget currentScreen = _selectedIndex == 0
        ? CategoriesScreen(
            categoryManager: widget.categoryManager,
            allTrips: widget.allTrips,
          )
        : _selectedIndex == 1
            ? AllTripsScreen(allTrips: widget.allTrips)
            : FavoritesScreen(favoriteTrips: widget.favoriteTrips);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            _titles[_selectedIndex],
            style: Theme.of(context).textTheme.headlineLarge,
          ),
        ),
        drawer: AppDrawer(
          saveFilters: widget.saveFilters,
          currentFilters: widget.currentFilters,
        ),
        body: currentScreen,
        //bottomNavigationBar: bottomNavigationBar(context),
        bottomNavigationBar: CustomBottomNavigationBar(
          selectedIndex: _selectedIndex,
          onItemTapped: (value) {
            setState(() {
              _selectedIndex = value;
            });
          },
        ),
      ),
    );
  }
}
