import 'package:flutter/material.dart';

extension DesctiptionText on Text {
  Text styleDescriptionText(BuildContext context) => Text(
        this.data,
        style: TextStyle(
          fontSize: 16,
          color: Theme.of(context).accentColor,
        ),
      );

  Text styleSectionText(BuildContext context) => Text(
        this.data,
        style: TextStyle(
          fontSize: 20,
          decoration: TextDecoration.underline,
          color: Theme.of(context).accentColor,
        ),
      );
}
