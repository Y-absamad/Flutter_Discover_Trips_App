
import 'package:flutter/material.dart';

class BuildListTitle extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;
  const BuildListTitle({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon as IconData?,
        size: 30,
        color: Colors.black,
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.displayLarge,
      ),
      onTap: () {
        onTap();
      },
    );
  }
}
