import 'dart:async';

import 'database.dart';

class FavoritesBloc {
  final StreamController _favoritesController =
      StreamController<List<Map<String, dynamic>>>.broadcast();

  FavoritesBloc() {
    getFavorites();
  }

  get favorites => _favoritesController.stream;

  void getFavorites() async {
    _favoritesController.sink.add(await DBProvider.db.getAllFavorites());
  }

  void addFavorite(int id, bool isFavorite) async {
    int result = await DBProvider.db.newFavorite(id, isFavorite);
    if (result == id) {
      getFavorites();
    }
  }

  void dispose() {
    _favoritesController.close();
  }
}
