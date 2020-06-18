import 'package:flutter/foundation.dart';

class Work {
  final String occupation;
  final String base;

  Work({
    @required this.occupation,
    @required this.base,
  });

  factory Work.fromJson(Map<String, dynamic> json) => Work(
        occupation: json['occupation'],
        base: json['base'],
      );

  Map<String, dynamic> toJson() => {
        "occupation": occupation,
        "base": base,
      };
}
