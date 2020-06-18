import 'package:flutter/foundation.dart';

import 'Appearance.dart';
import 'Biography.dart';
import 'Connections.dart';
import 'Images.dart';
import 'Powerstats.dart';
import 'Work.dart';

class Superhero {
  final int id;
  final String name;
  final String slug;
  final Powerstats powerstats;
  final Appearance appearance;
  final Biography biography;
  final Work work;
  final Connections connections;
  final Images images;

  const Superhero({
    @required this.id,
    @required this.name,
    @required this.slug,
    @required this.powerstats,
    @required this.appearance,
    @required this.biography,
    @required this.work,
    @required this.connections,
    @required this.images,
  });

  factory Superhero.fromJson(Map<String, dynamic> json) => Superhero(
        id: json['id'],
        name: json['name'],
        slug: json['slug'],
        powerstats: Powerstats.fromJson(json['powerstats']),
        appearance: Appearance.fromJson(json['appearance']),
        biography: Biography.fromJson(json['biography']),
        work: Work.fromJson(json['work']),
        connections: Connections.fromJson(json['connections']),
        images: Images.fromJson(json['images']),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'slug': slug,
        'powerstats': powerstats.toJson(),
        'appearance': appearance.toJson(),
        'biography': biography.toJson(),
        'work': work.toJson(),
        'connections': connections.toJson(),
        'images': images.toJson(),
      };
}
