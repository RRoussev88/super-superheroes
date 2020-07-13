import 'package:flutter/material.dart';

import '../models/superhero/Superhero.dart';
import '../UI/description_card.dart';

class SuperheroScreen extends StatelessWidget {
  final Superhero superHero;

  SuperheroScreen(this.superHero);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: Text(superHero.name)),
        body: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  // TODO: Use a placeholder image
                  image: NetworkImage(superHero.images.lg),
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: DescriptionCard(superHero)
            ),
          ],
        ),
      );
}
