import 'package:flutter/material.dart';

import '../models/superhero/Superhero.dart';
import '../screens/superhero_screen.dart';
import 'favorite_button.dart';

class SuperheroTile extends StatelessWidget {
  final Key key;
  final Superhero superHero;
  final bool isFavorite;

  SuperheroTile({
    required this.key,
    required this.superHero,
    required this.isFavorite,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ListTile(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => SuperheroScreen(
                key: key,
                superHero: superHero,
                isFavorite: isFavorite,
              ),
            ),
          );
        },
        leading: CircleAvatar(
          backgroundColor: Theme.of(context).primaryColorDark,
          radius: 30,
          child: CircleAvatar(
            radius: 24,
            child: ClipOval(
              child: Hero(
                tag: superHero.id,
                child: Image.network(
                  superHero.images.xs,
                  frameBuilder: (
                    BuildContext context,
                    Widget child,
                    int? frame,
                    bool wasSynchronouslyLoaded,
                  ) =>
                      frame == null
                          ? Text(superHero.name
                              .split(' ')
                              .map((word) => word[0])
                              .join())
                          : child,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
            ),
          ),
        ),
        title: Text(
          superHero.name,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        subtitle: Row(
          children: <Widget>[
            Icon(
              Icons.movie_filter,
              size: 22,
              color: Theme.of(context).textTheme.titleMedium?.color,
            ),
            SizedBox(width: 2),
            Flexible(
              child: Text(
                superHero.biography.publisher.length > 0
                    ? superHero.biography.publisher
                    : '-',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
          ],
        ),
        trailing: FavoriteButton(
          key: key,
          id: superHero.id,
          isFavorite: isFavorite,
        ),
      );
}
