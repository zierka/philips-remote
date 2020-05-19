// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Session _$SessionFromJson(Map<String, dynamic> json) {
  return Session(
    tv: json['tv'],
    credential: json['credential'],
  );
}

Map<String, dynamic> _$SessionToJson(Session instance) => <String, dynamic>{
      'tv': instance.tv,
      'credential': instance.credential,
    };
