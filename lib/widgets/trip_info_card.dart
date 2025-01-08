import 'package:flutter/material.dart';

class TripInfoCard extends StatelessWidget {
  final String textLabel;
  final IconData iconData;
  const TripInfoCard({
    super.key,
    required this.textLabel,
    required this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 5,
      children: [
        Icon(iconData, color: Colors.deepOrange, size: 25),
        Expanded(
          child: Text(
            textLabel,
            style: Theme.of(context).textTheme.headlineSmall,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
