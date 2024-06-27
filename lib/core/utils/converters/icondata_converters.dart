import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:freezed_annotation/freezed_annotation.dart';

class IconDataJsonConverter implements JsonConverter<IconData, Map<String, dynamic>> {
  const IconDataJsonConverter();

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

//write doc for this class

///

class IconDataSQLConverter extends TypeConverter<IconData, String> {
  const IconDataSQLConverter();

  @override
  IconData fromSql(String fromDb) {
    return const IconDataJsonConverter().fromJson(json.decode(fromDb) as Map<String, dynamic>);
  }

  @override
  String toSql(IconData value) {
    return json.encode(const IconDataJsonConverter().toJson(value));
  }
}
