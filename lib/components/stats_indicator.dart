import 'package:flutter/material.dart';

import '../extensions/description_text_extension.dart';

class StatsIndicator extends StatelessWidget {
  final String statName;
  final double value;

  const StatsIndicator({
    required this.statName,
    required this.value,
  });

  @override
  Widget build(BuildContext context) => Padding(
        padding: EdgeInsets.symmetric(vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('${statName.toUpperCase()} - ${value.toInt()}%')
                .styleDescriptionText(context),
            LinearProgressIndicator(
              value: value / 100,
              valueColor: AlwaysStoppedAnimation<Color>(
                  Theme.of(context).primaryColorDark),
              backgroundColor: Theme.of(context).dividerColor,
              minHeight: 12,
              semanticsLabel: statName,
              semanticsValue: value.toString(),
            ),
          ],
        ),
      );
}
