import 'package:flutter/material.dart';

extension DesctiptionText on Text {
  Text styleDescriptionText(BuildContext context) => Text(
        this.data ?? "",
        style: TextStyle(
          fontSize: 16,
          height: 1.5,
          color: Theme.of(context).indicatorColor,
        ),
      );

  Text styleSectionText(BuildContext context) => Text(
        this.data ?? "",
        style: TextStyle(
          fontSize: 20,
          decoration: TextDecoration.underline,
          color: Theme.of(context).indicatorColor,
        ),
      );
}
