import 'package:flutter/material.dart';

import '../models/superhero/Superhero.dart';
import '../UI/description_card.dart';

class SuperheroScreen extends StatelessWidget {
  final Superhero superHero;

  SuperheroScreen(this.superHero);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: Text(superHero.name)),
        body: Builder(
          builder: (BuildContext ctx) => Stack(
            children: <Widget>[
              Center(
                // TODO: Create Hero animation if possible
                child: FadeInImage.assetNetwork(
                  height: MediaQuery.of(ctx).size.height -
                      Scaffold.of(ctx).appBarMaxHeight,
                  placeholder: 'assets/images/superhero-placeholder.png',
                  image: superHero.images.lg,
                  fit: BoxFit.fitHeight,
                ),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: DescriptionCard(superHero),
              ),
            ],
          ),
        ),
      );
}
