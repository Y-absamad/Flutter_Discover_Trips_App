import 'package:flutter/material.dart';

class ListViewContainer extends StatelessWidget {
  final double height;
  final int length;
  final IndexedWidgetBuilder itemBuilder;
  const ListViewContainer({
    super.key,
    required this.height,
    required this.length,
    required this.itemBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: length,
        itemBuilder: itemBuilder,
      ),
    );
  }
}
