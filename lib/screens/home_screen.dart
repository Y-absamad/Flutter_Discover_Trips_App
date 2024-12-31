import 'package:discover_trips/screens/all_trips_screen.dart';
import 'package:flutter/material.dart';
import '../models/trip.dart';
import '../screens/categories_screen.dart';
import '../widgets/drawer/app_drawer.dart';
import 'favorites_screen.dart';

class HomeScreen extends StatefulWidget {
  final List<Trip> favoriteTrips;
  final List<Trip> allTrips;
  const HomeScreen({super.key, required this.favoriteTrips, required this.allTrips});

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
        ? CategoriesScreen()
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
        drawer: AppDrawer(),
        body: currentScreen,
        bottomNavigationBar: BottomNavigationBar(
          onTap: (value) {
            setState(() {
              _selectedIndex = value;
            });
          },
          currentIndex: _selectedIndex,
          backgroundColor: Theme.of(context).primaryColorLight,
          selectedItemColor: Colors.amber,
          selectedLabelStyle: const TextStyle(
            fontSize: 16,
            fontFamily: 'ELMessiri',
            fontWeight: FontWeight.bold,
          ),
          unselectedLabelStyle: const TextStyle(
            fontSize: 14,
            fontFamily: 'ELMessiri',
          ),
          unselectedItemColor: Colors.black54,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.dashboard),
              label: 'التصنيفات',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.view_agenda),
              label: 'الرحلات',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'المفضلة',
            ),
          ],
        ),
      ),
    );
  }
}
