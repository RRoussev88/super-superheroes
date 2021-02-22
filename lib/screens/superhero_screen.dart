import 'package:flutter/material.dart';

import '../models/superhero/Superhero.dart';
import '../components/favorite_button.dart';
import '../components/description_card.dart';
import '../utils/constants.dart' as AppConstants;
import '../utils/favorites_bloc.dart';

class SuperheroScreen extends StatefulWidget {
  final Function toggleLike;
  final Superhero superHero;
  final bool isFavorite;

  SuperheroScreen({
    @required this.superHero,
    @required this.toggleLike,
    @required this.isFavorite,
  });

  @override
  _SuperheroScreenState createState() => _SuperheroScreenState();
}

class _SuperheroScreenState extends State<SuperheroScreen> {
  final FavoritesBloc _bloc = FavoritesBloc();

  @override
  void dispose() {
    super.dispose();
    _bloc.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(widget.superHero.name),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: StreamBuilder<List<Map<String, dynamic>>>(
                initialData: [
                  {
                    AppConstants.DB_COLUMN_ID: widget.superHero.id,
                    AppConstants.DB_COLUMN_IS_FAV: widget.isFavorite ? 1 : 0,
                  }
                ],
                stream: _bloc.favorites,
                builder: (
                  BuildContext ctx,
                  AsyncSnapshot<List<Map<String, dynamic>>> snapshot,
                ) {
                  List<Map<String, dynamic>> favorites =
                      snapshot.hasData ? snapshot.data : [];

                  bool isFavorite = favorites.isNotEmpty &&
                      favorites.any((item) =>
                          item[AppConstants.DB_COLUMN_ID] ==
                              widget.superHero.id &&
                          item[AppConstants.DB_COLUMN_IS_FAV] == 1);

                  return FavoriteButton(
                    id: widget.superHero.id,
                    isFavorite: isFavorite,
                    toggleFavorite: (int id, bool isFav) => _bloc.addFavorite(
                      id,
                      !isFav,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
        body: Builder(
          builder: (BuildContext ctx) => Stack(
            children: <Widget>[
              Center(
                child: Hero(
                  tag: widget.superHero.id,
                  child: FadeInImage.assetNetwork(
                    height: MediaQuery.of(ctx).size.height -
                        Scaffold.of(ctx).appBarMaxHeight,
                    placeholder: 'assets/images/superhero-placeholder.png',
                    image: widget.superHero.images.lg,
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: DescriptionCard(widget.superHero),
              ),
            ],
          ),
        ),
      );
}
