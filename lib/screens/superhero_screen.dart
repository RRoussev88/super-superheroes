import 'package:flutter/material.dart';

import '../components/description_card.dart';
import '../components/favorite_button.dart';
import '../models/superhero/Superhero.dart';
import '../models/Favorite.dart';
import '../utils/bloc_provider.dart';
import '../utils/favorites_bloc.dart';

class SuperheroScreen extends StatelessWidget {
  final Key key;
  final Superhero superHero;
  final bool isFavorite;

  SuperheroScreen({
    this.key,
    @required this.superHero,
    @required this.isFavorite,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(superHero.name),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: StreamBuilder<List<Favorite>>(
                initialData: [Favorite(id: superHero.id, isFav: isFavorite)],
                stream: BlocProvider.of<FavoritesBloc>(context).favorites,
                builder: (context, snapshot) => FavoriteButton(
                  key: key,
                  id: superHero.id,
                  isFavorite: snapshot.data
                      .any((item) => item.id == superHero.id && item.isFav),
                ),
              ),
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
