import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onItemTapped;
  const CustomBottomNavigationBar(
      {super.key, required this.selectedIndex, required this.onItemTapped});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: onItemTapped,
      currentIndex: selectedIndex,
      backgroundColor: Theme.of(context).primaryColorLight,
      selectedItemColor: Colors.amberAccent,
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
    );
  }
}
