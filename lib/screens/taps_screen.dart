import 'package:flutter/material.dart';
import '../models/trip.dart';
import '../screens/categories_screen.dart';
import '../screens/favorites_screen.dart';
import '../widgets/drawer/app_drawer.dart';

class TapsScreen extends StatefulWidget {
  final List<Trip> favoriteTrips;
  const TapsScreen({super.key, required this.favoriteTrips});

  @override
  State<TapsScreen> createState() => _TapsScreenState();
}

class _TapsScreenState extends State<TapsScreen> {
  late List<Map<String, Object>> _screens;

  @override
  void initState() {
    _screens = [
      {'screen': CategoriesScreen(), 'title': 'تصنيفات الرحلات'},
      {
        'screen': FavoritesScreen(favoriteTrips: widget.favoriteTrips),
        'title': 'الرحلات المفضلة'
      }
    ];
    super.initState();
  }

  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            _screens[_selectedIndex]['title'] as String,
            style: Theme.of(context).textTheme.headlineLarge,
          ),
        ),
        drawer: AppDrawer(),
        body: _screens[_selectedIndex]['screen'] as Widget,
        bottomNavigationBar: BottomNavigationBar(
          onTap: (value) {
            setState(() {
              _selectedIndex = value;
            });
          },
          currentIndex: _selectedIndex,
          backgroundColor: Theme.of(context).primaryColorLight,
          selectedItemColor: Colors.amber,
          selectedLabelStyle: TextStyle(
            fontSize: 16,
            fontFamily: 'ELMessiri',
            fontWeight: FontWeight.bold,
          ),
          unselectedLabelStyle: TextStyle(
            fontSize: 14,
            fontFamily: 'ELMessiri',
          ),
          unselectedItemColor: Colors.black54,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.dashboard), label: 'التصنيفات'),
            BottomNavigationBarItem(icon: Icon(Icons.star), label: 'المفضلة'),
          ],
        ),
      ),
      
    );
  }
}
