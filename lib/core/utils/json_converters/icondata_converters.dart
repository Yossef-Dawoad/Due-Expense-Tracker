import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class IconDataConverter
    implements JsonConverter<IconData, Map<String, dynamic>> {
  const IconDataConverter();

  @override
  IconData fromJson(Map<String, dynamic> json) {
    return IconData(
      json['codePoint'] as int,
      fontFamily: json['fontFamily'] as String?,
      fontPackage: json['fontPackage'] as String?,
      matchTextDirection: json['matchTextDirection'] as bool? ?? false,
    );
  }

  @override
  Map<String, dynamic> toJson(IconData iconData) => {
        'codePoint': iconData.codePoint,
        'fontFamily': iconData.fontFamily,
        'fontPackage': iconData.fontPackage,
        'matchTextDirection': iconData.matchTextDirection,
      };
}
