import 'package:flutter/material.dart';

import '../models/superhero/Superhero.dart';
import '../extensions/description_text_extension.dart';

class SuperheroScreen extends StatelessWidget {
  final Superhero superHero;

  SuperheroScreen(this.superHero);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: Text(superHero.name)),
        body: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(superHero.images.lg),
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                // TODO: Make it expandable
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Theme.of(context).accentColor.withOpacity(0.5),
                      spreadRadius: 3,
                      blurRadius: 3,
                      offset: Offset(3, 3),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(
                    color: Theme.of(context).primaryColorLight,
                  ),
                  color: Colors.white70,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      superHero.name,
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        fontSize: 24,
                        color: Theme.of(context).accentColor,
                      ),
                    ),
                    Text('Full name: ${superHero.biography.fullName}')
                        .styleDescriptionText(context),
                    Text('Alignment: ${superHero.biography.alignment}')
                        .styleDescriptionText(context),
                    Text('Publisher: ${superHero.biography.publisher}')
                        .styleDescriptionText(context),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
}
