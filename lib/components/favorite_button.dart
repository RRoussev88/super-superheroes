import 'package:flutter/material.dart';

import '../models/Favorite.dart';
import '../utils/bloc_provider.dart';
import '../utils/favorites_bloc.dart';

class FavoriteButton extends StatelessWidget {
  final Key key;
  final int id;

  FavoriteButton(this.key, this.id) : super(key: key);

  @override
  Widget build(BuildContext context) => StreamBuilder<List<Favorite>>(
      stream: BlocProvider.of<FavoritesBloc>(context).favorites,
      builder: (BuildContext ctx, AsyncSnapshot<List<Favorite>> snapshot) {
        final bool isFavorite = snapshot.hasData &&
            snapshot.data.any((Favorite item) => item.id == id);

        return PhysicalModel(
          color: Theme.of(context).secondaryHeaderColor,
          shadowColor: isFavorite ? Colors.redAccent : Colors.black,
          borderRadius: BorderRadius.circular(24),
          elevation: isFavorite ? 8 : 4,
          child: IconButton(
            icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_border),
            color: Colors.redAccent,
            onPressed: () {
              Favorite favToAdd = Favorite(
                id: id,
                isFav: !isFavorite,
              );
              BlocProvider.of<FavoritesBloc>(context).addFavorite(favToAdd);
            },
          ),
        );
      });
}
