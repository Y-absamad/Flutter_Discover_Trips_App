import 'package:flutter/material.dart';
import 'build_list_title.dart';
import 'package:discover_trips/utils/app_router.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 260,
      child: Column(
        children: [
          Container(
            height: 55,
            width: double.infinity,
            color: Theme.of(context).primaryColorLight,
            alignment: Alignment.center,
            child: Text(
              'دليلك السياحي',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ),
          BuildListTitle(
            onTap: () =>
                Navigator.pushReplacementNamed(context, AppRoute.tapsScreen),
            title: '    الرحلات',
            icon: Icons.card_travel,
          ),
          BuildListTitle(
            onTap: () => Navigator.pushReplacementNamed(context, AppRoute.filtersScreen),
            title: '    الفلترة',
            icon: Icons.filter_list,
          ),
        ],
      ),
    );
  }
}
