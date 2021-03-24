import 'package:flutter/material.dart';

class TextItem extends StatelessWidget {
  final String itemKey;
  final String itemValue;

  //value部分的文字在过多的时候容易溢出，这里添加属性：表示是否要Expanded,默认true
  final bool itemValueIsExpanded;

  TextItem(this.itemKey, this.itemValue, {this.itemValueIsExpanded = true});

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
        itemValueIsExpanded
            ? Expanded(
                child: Text(
                this.itemValue,
              ))
            : Text(
                this.itemValue,
              ),
      ],
    );
  }
}
