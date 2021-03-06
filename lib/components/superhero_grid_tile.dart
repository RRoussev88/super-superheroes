import 'dart:ui';

import 'package:flutter/material.dart';

import '../models/superhero/Superhero.dart';
import '../screens/superhero_screen.dart';
import 'favorite_button.dart';

class SuperheroGridTile extends StatelessWidget {
  final Key key;
  final Superhero superHero;
  final bool isFavorite;

  SuperheroGridTile({
    this.key,
    @required this.superHero,
    @required this.isFavorite,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => GridTile(
        child: InkWell(
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
                              superHero.images.sm,
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
                            child: FavoriteButton(
                              key: key,
                              id: superHero.id,
                              isFavorite: isFavorite,
                            ),
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
                        child: LayoutBuilder(builder: (_, c8s) {
                          final ThemeData themeData = Theme.of(context);

                          return Column(
                            children: [
                              Expanded(
                                child: Text(
                                  superHero.name,
                                  overflow: TextOverflow.ellipsis,
                                  style: c8s.maxWidth > 200
                                      ? themeData.textTheme.headline6
                                          .copyWith(fontSize: c8s.maxWidth / 8)
                                      : themeData.textTheme.headline6,
                                ),
                              ),
                              Expanded(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(
                                      Icons.movie_filter,
                                      size: 22,
                                      color:
                                          themeData.textTheme.subtitle2.color,
                                    ),
                                    SizedBox(width: 2),
                                    Flexible(
                                      child: Text(
                                        superHero.biography.publisher ?? '-',
                                        overflow: TextOverflow.ellipsis,
                                        style: c8s.maxWidth > 200
                                            ? themeData.textTheme.subtitle2
                                                .copyWith(
                                                    fontSize: c8s.maxWidth / 10)
                                            : themeData.textTheme.subtitle2,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          );
                        }),
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
