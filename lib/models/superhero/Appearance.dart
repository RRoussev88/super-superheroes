import 'dart:convert';

class Appearance {
  final String gender;
  final String race;
  final List<String> height;
  final List<String> weight;
  final String eyeColor;
  final String hairColor;

  const Appearance({
    required this.gender,
    required this.race,
    required this.height,
    required this.weight,
    required this.eyeColor,
    required this.hairColor,
  });

  factory Appearance.fromJson(Map<String, dynamic> json) => Appearance(
        gender: json['gender'],
        race: json['race'],
        height: List<String>.from(json['height']),
        weight: List<String>.from(json['weight']),
        eyeColor: json['eyeColor'],
        hairColor: json['hairColor'],
      );

  Map<String, dynamic> toJson() => {
        'gender': gender,
        'race': race,
        'height': jsonEncode(height),
        'weight': jsonEncode(weight),
        'eyeColor': eyeColor,
        'hairColor': hairColor,
      };
}
