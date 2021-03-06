import 'package:flutter/material.dart';

import '../models/superhero/Superhero.dart';
import '../extensions/description_text_extension.dart';
import 'stats_indicator.dart';

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
        widthFactor: MediaQuery.of(context).size.width >= 400 ? 0.5 : 1,
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
            tilePadding: const EdgeInsets.symmetric(horizontal: 10),
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
                    Text('FULL NAME: ${widget.superHero.biography.fullName}')
                        .styleDescriptionText(context),
                    Text('ALIGNMENT: ${widget.superHero.biography.alignment}')
                        .styleDescriptionText(context),
                    Text('FIRST APPEARANCE: ${widget.superHero.biography.firstAppearance}')
                        .styleDescriptionText(context),
                    Text('ALTER EGOS: ${widget.superHero.biography.alterEgos}')
                        .styleDescriptionText(context),
                    Text('ALIASES: ${widget.superHero.biography.aliases.join(', ')}')
                        .styleDescriptionText(context),
                    Text('PLACE OF BIRTH: ${widget.superHero.biography.placeOfBirth}')
                        .styleDescriptionText(context),
                    Text('PUBLISHER: ${widget.superHero.biography.publisher}')
                        .styleDescriptionText(context),
                    _sectionDivider,
                    const Text('Appearance').styleSectionText(context),
                    Text('GENDER: ${widget.superHero.appearance.gender}')
                        .styleDescriptionText(context),
                    Text('RACE: ${widget.superHero.appearance.race}')
                        .styleDescriptionText(context),
                    Text('HEIGHT: ${widget.superHero.appearance.height[1]}')
                        .styleDescriptionText(context),
                    Text('WEIGHT: ${widget.superHero.appearance.weight[1]}')
                        .styleDescriptionText(context),
                    Text('EYE COLOR: ${widget.superHero.appearance.eyeColor}')
                        .styleDescriptionText(context),
                    Text('HAIR COLOR: ${widget.superHero.appearance.hairColor}')
                        .styleDescriptionText(context),
                    _sectionDivider,
                    const Text('Powerstats').styleSectionText(context),
                    StatsIndicator(
                      statName: 'Intelligence',
                      value:
                          widget.superHero.powerstats.intelligence.toDouble(),
                    ),
                    StatsIndicator(
                      statName: 'Strength',
                      value: widget.superHero.powerstats.strength.toDouble(),
                    ),
                    StatsIndicator(
                      statName: 'Speed',
                      value: widget.superHero.powerstats.speed.toDouble(),
                    ),
                    StatsIndicator(
                      statName: 'Durability',
                      value: widget.superHero.powerstats.durability.toDouble(),
                    ),
                    StatsIndicator(
                      statName: 'Power',
                      value: widget.superHero.powerstats.power.toDouble(),
                    ),
                    StatsIndicator(
                      statName: 'Combat',
                      value: widget.superHero.powerstats.combat.toDouble(),
                    ),
                    _sectionDivider,
                    const Text('Work').styleSectionText(context),
                    Text('OCCUPATION: ${widget.superHero.work.occupation}')
                        .styleDescriptionText(context),
                    Text('BASE: ${widget.superHero.work.base}')
                        .styleDescriptionText(context),
                    _sectionDivider,
                    const Text('Connections').styleSectionText(context),
                    Text('GROUP AFFILIATION: ${widget.superHero.connections.groupAffiliation}')
                        .styleDescriptionText(context),
                    Text('RELATIVES: ${widget.superHero.connections.relatives}')
                        .styleDescriptionText(context),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}
