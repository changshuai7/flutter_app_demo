import 'package:flutter/material.dart';


class TextItem extends StatelessWidget {
  final String itemKey;
  final String itemValue;

  TextItem(this.itemKey, this.itemValue);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          this.itemKey,
          style: TextStyle(color: Colors.grey),
        ),
        SizedBox(
          width: 8,
        ),
        Text(this.itemValue)
      ],
    );
  }
}
