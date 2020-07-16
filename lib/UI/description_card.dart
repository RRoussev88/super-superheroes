import 'package:flutter/material.dart';

import '../models/superhero/Superhero.dart';
import '../extensions/description_text_extension.dart';

class DescriptionCard extends StatefulWidget {
  final Superhero superHero;

  DescriptionCard(this.superHero);

  @override
  _DescriptionCardState createState() => _DescriptionCardState();
}

class _DescriptionCardState extends State<DescriptionCard> {
  final Divider _sectionDivider = const Divider(height: 15, thickness: 2);

  double _appBarMaxHeight = 0.0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _appBarMaxHeight = Scaffold.of(context).appBarMaxHeight;
  }

  @override
  Widget build(BuildContext context) => FractionallySizedBox(
        widthFactor: MediaQuery.of(context).orientation == Orientation.portrait
            ? 1
            : 0.5,
        child: Container(
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).accentColor.withOpacity(0.5),
                spreadRadius: 3,
                blurRadius: 3,
                offset: const Offset(3, 3),
              ),
            ],
            borderRadius: BorderRadius.circular(25),
            border: Border.all(
              color: Theme.of(context).primaryColorLight,
            ),
            color: Colors.white70,
          ),
          child: ExpansionTile(
            tilePadding: EdgeInsets.symmetric(horizontal: 10),
            childrenPadding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
            expandedCrossAxisAlignment: CrossAxisAlignment.start,
            expandedAlignment: Alignment.topLeft,
            title: Text(
              widget.superHero.name,
              overflow: TextOverflow.fade,
              softWrap: false,
              style: TextStyle(
                decoration: TextDecoration.underline,
                fontSize: 24,
                color: Theme.of(context).accentColor,
              ),
            ),
            children: [
              Container(
                height:
                    MediaQuery.of(context).size.height - 100 - _appBarMaxHeight,
                child: ListView(
                  children: [
                    _sectionDivider,
                    const Text('Biography').styleSectionText(context),
                    Text('Full name: ${widget.superHero.biography.fullName}')
                        .styleDescriptionText(context),
                    Text('Alignment: ${widget.superHero.biography.alignment}')
                        .styleDescriptionText(context),
                    Text('First appearance: ${widget.superHero.biography.firstAppearance}')
                        .styleDescriptionText(context),
                    Text('Alter egos: ${widget.superHero.biography.alterEgos}')
                        .styleDescriptionText(context),
                    Text('Aliases: ${widget.superHero.biography.aliases.join(', ')}')
                        .styleDescriptionText(context),
                    Text('Place of birth: ${widget.superHero.biography.placeOfBirth}')
                        .styleDescriptionText(context),
                    Text('Publisher: ${widget.superHero.biography.publisher}')
                        .styleDescriptionText(context),
                    _sectionDivider,
                    const Text('Appearance').styleSectionText(context),
                    Text('Gender: ${widget.superHero.appearance.gender}')
                        .styleDescriptionText(context),
                    Text('Race: ${widget.superHero.appearance.race}')
                        .styleDescriptionText(context),
                    Text('Height: ${widget.superHero.appearance.height[1]}')
                        .styleDescriptionText(context),
                    Text('Weight: ${widget.superHero.appearance.weight[1]}')
                        .styleDescriptionText(context),
                    Text('Eye color: ${widget.superHero.appearance.eyeColor}')
                        .styleDescriptionText(context),
                    Text('Hair color: ${widget.superHero.appearance.hairColor}')
                        .styleDescriptionText(context),
                    _sectionDivider,
                    const Text('Powerstats').styleSectionText(context),
                    Text('Intelligence: ${widget.superHero.powerstats.intelligence}')
                        .styleDescriptionText(context),
                    Text('Strength: ${widget.superHero.powerstats.strength}')
                        .styleDescriptionText(context),
                    Text('Speed: ${widget.superHero.powerstats.speed}')
                        .styleDescriptionText(context),
                    Text('Durability: ${widget.superHero.powerstats.durability}')
                        .styleDescriptionText(context),
                    Text('Power: ${widget.superHero.powerstats.power}')
                        .styleDescriptionText(context),
                    Text('Combat: ${widget.superHero.powerstats.combat}')
                        .styleDescriptionText(context),
                    _sectionDivider,
                    const Text('Work').styleSectionText(context),
                    Text('Occupation: ${widget.superHero.work.occupation}')
                        .styleDescriptionText(context),
                    Text('Base: ${widget.superHero.work.base}')
                        .styleDescriptionText(context),
                    _sectionDivider,
                    const Text('Connections').styleSectionText(context),
                    Text('Group affiliation: ${widget.superHero.connections.groupAffiliation}')
                        .styleDescriptionText(context),
                    Text('Relatives: ${widget.superHero.connections.relatives}')
                        .styleDescriptionText(context),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}
