import 'package:flutter/material.dart';

import '../components/description_card.dart';
import '../components/favorite_button.dart';
import '../models/superhero/Superhero.dart';

class SuperheroScreen extends StatelessWidget {
  final Key key;
  final Superhero superHero;

  SuperheroScreen(this.key, this.superHero) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(superHero.name),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: FavoriteButton(key, superHero.id),
            ),
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
