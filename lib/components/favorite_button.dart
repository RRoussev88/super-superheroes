import 'package:flutter/material.dart';

import '../models/Favorite.dart';
import '../utils/bloc_provider.dart';
import '../utils/favorites_bloc.dart';

class FavoriteButton extends StatelessWidget {
  final Key key;
  final int id;
  final bool isFavorite;

  const FavoriteButton({
    this.key,
    @required this.id,
    @required this.isFavorite,
  }) : super(key: key);

  void _toggleFavorite(BuildContext ctx) {
    Favorite favToAdd = Favorite(
      id: id,
      isFav: !isFavorite,
    );
    BlocProvider.of<FavoritesBloc>(ctx).addFavorite(favToAdd);
  }

  @override
  Widget build(BuildContext context) => PhysicalModel(
        color: Theme.of(context).secondaryHeaderColor,
        shadowColor: isFavorite ? Colors.redAccent : Colors.black,
        borderRadius: BorderRadius.circular(24),
        elevation: isFavorite ? 8 : 4,
        child: IconButton(
          icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_border),
          color: Colors.redAccent,
          onPressed: () => _toggleFavorite(context),
        ),
      );
}
