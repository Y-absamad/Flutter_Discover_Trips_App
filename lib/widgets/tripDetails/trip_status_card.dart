import 'package:flutter/material.dart';

class TripStatusCard extends StatelessWidget {
  final String label;
  final bool isTrue;

  const TripStatusCard({
    super.key,
    required this.label,
    required this.isTrue,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 5,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        SizedBox(
          height: 45,
          width: 40,
          child: Stack(
            children: [
              Positioned(
                left: 5,
                top: 5,
                child: Icon(
                  Icons.crop_square_outlined,
                  color: Colors.black,
                  size: 30,
                ),
              ),
              Positioned(
                left: isTrue ? 3 : 0,
                top: isTrue ? -5 : 0,
                child: Icon(
                  isTrue ? Icons.done : Icons.close,
                  size: 40,
                  color: isTrue ? Colors.green : Colors.red,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
