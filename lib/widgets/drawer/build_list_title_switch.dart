  import 'package:flutter/material.dart';

ListTile buildListTitleSwitch({
    required final String title,
    required final String subtitle,
    required bool currentValue,
    required Function(bool) updateValue,
    required BuildContext context,
  }) {
    return ListTile(
      title: Text(
        title,
        style: Theme.of(context).textTheme.displayLarge,
      ),
      subtitle: Text(
        subtitle,
        style: Theme.of(context).textTheme.headlineSmall!.copyWith(
          fontSize: 12,
        ),
      ),
      trailing: Switch(
        value: currentValue,
        onChanged: updateValue,
        activeColor: Colors.blue[900],
        activeTrackColor: Colors.blue,
      ),
    );
  }
