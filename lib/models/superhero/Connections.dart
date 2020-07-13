import 'package:flutter/foundation.dart';

class Connections {
  final String groupAffiliation;
  final String relatives;

  const Connections({
    @required this.groupAffiliation,
    @required this.relatives,
  });

  factory Connections.fromJson(Map<String, dynamic> json) => Connections(
        groupAffiliation: json['groupAffiliation'],
        relatives: json['relatives'],
      );

  Map<String, dynamic> toJson() => {
        "groupAffiliation": groupAffiliation,
        "relatives": relatives,
      };
}
