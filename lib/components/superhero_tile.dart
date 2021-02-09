import 'package:flutter/material.dart';

import '../models/superhero/Superhero.dart';
import '../screens/superhero_screen.dart';

class SuperheroTile extends StatelessWidget {
  final Superhero superHero;

  SuperheroTile(this.superHero);

  Image _getAvatarImage() => Image.network(
        superHero.images.xs,
        frameBuilder: (
          BuildContext context,
          Widget child,
          int frame,
          bool wasSynchronouslyLoaded,
        ) =>
            frame == null
                ? Text(superHero.name.split(' ').map((word) => word[0]).join())
                : child,
        fit: BoxFit.cover,
        width: double.infinity,
      );

  @override
  Widget build(BuildContext context) => ListTile(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => SuperheroScreen(superHero)));
        },
        leading: CircleAvatar(
          child: ClipOval(
            child: Hero(
              tag: superHero.id,
              child: _getAvatarImage(),
            ),
          ),
        ),
        title: Text(
          superHero.name,
          style: Theme.of(context).textTheme.headline6,
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
                superHero.biography.publisher,
                style: Theme.of(context).textTheme.subtitle2,
              ),
            ),
          ],
        ),
        trailing: IconButton(
          icon: Icon(Icons.favorite_border),
          color: Colors.redAccent,
          // TODO: implement favorites functionallity using shared prefs
          onPressed: () {},
        ),
      );
}
