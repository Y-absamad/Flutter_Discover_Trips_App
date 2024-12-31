import 'package:flutter/material.dart';

class SectionTitel extends StatelessWidget {
  final String sectionTitel  ;
  const SectionTitel({super.key ,required this.sectionTitel});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      alignment: Alignment.topRight,
      child: Text(
        sectionTitel,
        style: Theme.of(context).textTheme.headlineMedium,
      ),
    );
  }
}
