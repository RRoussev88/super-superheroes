import 'package:flutter/foundation.dart';

class Images {
  final String xs;
  final String sm;
  final String md;
  final String lg;

  Images({
    @required this.xs,
    @required this.sm,
    @required this.md,
    @required this.lg,
  });

  factory Images.fromJson(Map<String, dynamic> json) => Images(
        xs: json['xs'],
        sm: json['sm'],
        md: json['md'],
        lg: json['lg'],
      );

  Map<String, dynamic> toJson() => {
        'xs': xs,
        'sm': sm,
        'md': md,
        'lg': lg,
      };
}
