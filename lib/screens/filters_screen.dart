import 'package:discover_trips/widgets/drawer/app_drawer.dart';
import 'package:flutter/material.dart';

import '../widgets/filters/build_list_title_switch.dart';

class FiltersScreen extends StatefulWidget {
  final Function saveFilters;
  final Map<String, bool> currentFilters;
  const FiltersScreen(
      {super.key, required this.saveFilters, required this.currentFilters});

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
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
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          // actions: [
          //   IconButton(
          //     onPressed: () {
          //       saveChanges();
          //     },
          //     icon: Icon(Icons.save),
          //   )
          // ],
          title: Text(
            'الفلترة',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
        ),
        drawer: AppDrawer(),
        body: Column(
          children: [
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
      ),
    );
  }
}
