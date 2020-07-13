import 'package:flutter/material.dart';

import '../models/superhero/Superhero.dart';
import '../screens/superhero_screen.dart';

class SuperheroTile extends StatelessWidget {
  final Superhero superHero;

  const SuperheroTile(this.superHero);

  @override
  Widget build(BuildContext context) => ListTile(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => SuperheroScreen(
                superHero,
              ),
            ),
          );
        },
        leading: CircleAvatar(
          // TODO: Use a placeholder image
          backgroundImage: NetworkImage(
            superHero.images.xs,
          ),
        ),
        title: Text(
          superHero.name,
        ),
        trailing: IconButton(
          icon: Icon(Icons.favorite_border),
          color: Colors.redAccent,
          // TODO: implement favorites functionallity using shared prefs
          onPressed: () {},
        ),
      );
}
