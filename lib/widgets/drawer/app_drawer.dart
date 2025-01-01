import 'package:flutter/material.dart';

import 'build_list_title_switch.dart';

class AppDrawer extends StatefulWidget {
  final Function saveFilters;
  final Map<String, bool> currentFilters;
  const AppDrawer(
      {super.key, required this.saveFilters, required this.currentFilters});

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  late bool isInSummer;
  late bool isInWinter;
  late bool isForFamilies;

  void saveFilterChanges() {
    final selectedFilters = {
      'summer': isInSummer,
      'winter': isInWinter,
      'family': isForFamilies,
    };
    widget.saveFilters(selectedFilters);
  }

  @override
  void initState() {
    isInSummer = widget.currentFilters['summer']!;
    isInWinter = widget.currentFilters['winter']!;
    isForFamilies = widget.currentFilters['family']!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 300,
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
          const SizedBox(height: 30),
          buildListTitleSwitch(
              context: context,
              title: 'الرحلات الصيفية',
              subtitle: 'اظهار الرحلات في فصل الصيف فقط',
              currentValue: isInSummer,
              updateValue: (newValue) {
                setState(() {
                  isInSummer = newValue;
                });
                saveFilterChanges();
              }),
          buildListTitleSwitch(
              context: context,
              title: 'الرحلات الشتوية',
              subtitle: 'اظهار الرحلات في فصل الشتاء فقط',
              currentValue: isInWinter,
              updateValue: (newValue) {
                setState(() {
                  isInWinter = newValue;
                });
                saveFilterChanges();
              }),
          buildListTitleSwitch(
              context: context,
              title: 'الرحلات العائلية',
              subtitle: 'اظهار الرحلات العائلية فقط',
              currentValue: isForFamilies,
              updateValue: (newValue) {
                setState(() {
                  isForFamilies = newValue;
                });
                saveFilterChanges();
              }),
        ],
      ),
    );
  }
}
