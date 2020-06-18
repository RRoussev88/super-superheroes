import 'package:flutter/foundation.dart';

class Powerstats {
  final int intelligence;
  final int strength;
  final int speed;
  final int durability;
  final int power;
  final int combat;

  Powerstats({
    @required this.intelligence,
    @required this.strength,
    @required this.speed,
    @required this.durability,
    @required this.power,
    @required this.combat,
  });

  factory Powerstats.fromJson(Map<String, dynamic> json) => Powerstats(
        intelligence: json['intelligence'],
        strength: json['strength'],
        speed: json['speed'],
        durability: json['durability'],
        power: json['power'],
        combat: json['combat'],
      );

  Map<String, dynamic> toJson() => {
        'intelligence': intelligence,
        'strength': strength,
        'speed': speed,
        'durability': durability,
        'power': power,
        'combat': combat,
      };
}
