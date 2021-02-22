import 'package:flutter/material.dart';

import '../models/superhero/Superhero.dart';
import '../screens/superhero_screen.dart';
import 'favorite_button.dart';

class SuperheroTile extends StatelessWidget {
  final Superhero superHero;

  SuperheroTile(this.superHero) : super(key: ValueKey(superHero.id));

  @override
  Widget build(BuildContext context) => ListTile(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => SuperheroScreen(superHero),
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
                    int frame,
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
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.headline5,
        ),
        subtitle: Row(
          children: <Widget>[
            Icon(
              Icons.movie_filter,
              size: 22,
              color: Theme.of(context).textTheme.subtitle2.color,
            ),
            SizedBox(width: 2),
            Flexible(
              child: Text(
                superHero.biography.publisher ?? '-',
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.subtitle2,
              ),
            ),
          ],
        ),
        trailing: FavoriteButton(superHero.id),
      );
}
