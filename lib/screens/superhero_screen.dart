import 'package:flutter/material.dart';

import '../models/superhero/Superhero.dart';
import '../components/favorite_button.dart';
import '../components/description_card.dart';

class SuperheroScreen extends StatelessWidget {
  final Superhero superHero;

  const SuperheroScreen(this.superHero);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(superHero.name),
          actions: [
            FavoriteButton(false),
            SizedBox(
              width: 15,
            )
          ],
        ),
        body: Builder(
          builder: (BuildContext ctx) => Stack(
            children: <Widget>[
              Center(
                child: Hero(
                  tag: superHero.id,
                  child: FadeInImage.assetNetwork(
                    height: MediaQuery.of(ctx).size.height -
                        Scaffold.of(ctx).appBarMaxHeight,
                    placeholder: 'assets/images/superhero-placeholder.png',
                    image: superHero.images.lg,
                    fit: BoxFit.fitHeight,
                  ),
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
