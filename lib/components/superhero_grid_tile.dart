import 'dart:ui';

import 'package:flutter/material.dart';

import 'favorite_button.dart';
import '../models/superhero/Superhero.dart';
import '../screens/superhero_screen.dart';

class SuperheroGridTile extends StatelessWidget {
  final Superhero superHero;

  const SuperheroGridTile(this.superHero);

  @override
  Widget build(BuildContext context) => GridTile(
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => SuperheroScreen(superHero)));
          },
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            elevation: 4,
            color: Theme.of(context).primaryColor,
            child: Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Column(
                  children: [
                    Expanded(
                      flex: 5,
                      child: Stack(
                        children: [
                          Hero(
                            tag: superHero.id,
                            child: Image.network(
                              superHero.images.md,
                              frameBuilder: (
                                BuildContext context,
                                Widget child,
                                int frame,
                                bool wasSynchronouslyLoaded,
                              ) =>
                                  frame == null
                                      ? Center(
                                          child: Text(
                                            superHero.name
                                                .split(' ')
                                                .map((word) => word[0])
                                                .join(),
                                            style: TextStyle(
                                              fontSize: 42,
                                              color: Colors.white,
                                            ),
                                          ),
                                        )
                                      : child,
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ),
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: FavoriteButton(false),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        padding: EdgeInsets.all(8),
                        width: double.infinity,
                        color: Theme.of(context).secondaryHeaderColor,
                        child: Column(
                          children: [
                            Text(
                              superHero.name,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.headline6,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(
                                  Icons.movie_filter,
                                  size: 22,
                                  color: Theme.of(context)
                                      .textTheme
                                      .subtitle2
                                      .color,
                                ),
                                SizedBox(width: 2),
                                Flexible(
                                  child: Text(
                                    superHero.biography.publisher ?? '-',
                                    overflow: TextOverflow.ellipsis,
                                    style:
                                        Theme.of(context).textTheme.subtitle2,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
}
