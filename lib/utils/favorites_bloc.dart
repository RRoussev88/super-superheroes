import 'dart:async';

import '../models/Favorite.dart';
import 'bloc.dart';
import 'database.dart';

class FavoritesBloc implements Bloc {
  final StreamController<List<Favorite>> _favoritesController =
      StreamController<List<Favorite>>.broadcast();

  FavoritesBloc() {
    getFavorites();
  }

  Stream<List<Favorite>> get favorites => _favoritesController.stream;

  void getFavorites() async {
    _favoritesController.sink.add(await DBProvider.db.getAllFavorites());
  }

  void addFavorite(Favorite favorite) async {
    int result = await DBProvider.db.addFavorite(favorite);
    if (result == favorite.id) {
      getFavorites();
    }
  }

  @override
  void dispose() {
    _favoritesController.close();
  }
}
