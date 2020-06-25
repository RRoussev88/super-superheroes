import 'package:flutter/material.dart';

extension DesctiptionText on Text {
  Text styleDescriptionText(context) => Text(
        this.data,
        style: TextStyle(
          fontSize: 16,
          color: Theme.of(context).accentColor,
        ),
      );
}
