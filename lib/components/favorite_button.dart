import 'package:flutter/material.dart';

import '../utils/favorites_bloc.dart';

class FavoriteButton extends StatelessWidget {
  final Function toggleFavorite;
  final bool isFavorite;
  final int id;

  FavoriteButton({
    @required this.id,
    @required this.isFavorite,
    @required this.toggleFavorite,
  }) : super(key: ValueKey(id));

  final FavoritesBloc bloc = FavoritesBloc();

  @override
  Widget build(BuildContext context) => PhysicalModel(
        color: Theme.of(context).secondaryHeaderColor,
        shadowColor: isFavorite ? Colors.redAccent : Colors.black,
        borderRadius: BorderRadius.circular(24),
        elevation: isFavorite ? 8 : 4,
        child: IconButton(
          icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_border),
          color: Colors.redAccent,
          onPressed: () => toggleFavorite(id, isFavorite),
        ),
      );
}
