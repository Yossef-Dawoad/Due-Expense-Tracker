import 'package:flutter/material.dart';
import 'package:dart_mappable/dart_mappable.dart';

class IconDataMapper extends SimpleMapper<IconData> {
  const IconDataMapper();

  @override
  IconData decode(dynamic value) {
    return IconData(
      value['codePoint'] as int,
      fontFamily: value['fontFamily'] as String?,
      fontPackage: value['fontPackage'] as String?,
      matchTextDirection: value['matchTextDirection'] as bool? ?? false,
    );
  }

  @override
  dynamic encode(IconData self) {
    return {
      'codePoint': self.codePoint,
      'fontFamily': self.fontFamily,
      'fontPackage': self.fontPackage,
      'matchTextDirection': self.matchTextDirection,
    };
  }
}
