import '../utils/constants.dart' as AppConstants;

class Favorite {
  final int id;
  final bool isFav;

  const Favorite({required this.id, required this.isFav});

  factory Favorite.fromJson(Map<String, dynamic> json) => Favorite(
        id: json[AppConstants.DB_COLUMN_ID],
        isFav: json[AppConstants.DB_COLUMN_IS_FAV] == 1,
      );

  Map<String, dynamic> toJson() => {
        AppConstants.DB_COLUMN_ID: id,
        AppConstants.DB_COLUMN_IS_FAV: isFav ? 1 : 0,
      };
}
