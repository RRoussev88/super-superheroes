import 'dart:convert';
import 'package:flutter/foundation.dart';

class Biography {
  final String fullName;
  final String alterEgos;
  final List<String> aliases;
  final String placeOfBirth;
  final String firstAppearance;
  final String publisher;
  final String alignment;

  const Biography({
    @required this.fullName,
    @required this.alterEgos,
    @required this.aliases,
    @required this.placeOfBirth,
    @required this.firstAppearance,
    @required this.publisher,
    @required this.alignment,
  });

  factory Biography.fromJson(Map<String, dynamic> json) => Biography(
        fullName: json['fullName'],
        alterEgos: json['alterEgos'],
        aliases: List<String>.from(json['aliases']),
        placeOfBirth: json['placeOfBirth'],
        firstAppearance: json['firstAppearance'],
        publisher: json['publisher'],
        alignment: json['alignment'],
      );

  Map<String, dynamic> toJson() => {
        'fullName': fullName,
        'alterEgos': alterEgos,
        'aliases': jsonEncode(aliases),
        'placeOfBirth': placeOfBirth,
        'firstAppearance': firstAppearance,
        'publisher': publisher,
        'alignment': alignment,
      };
}
