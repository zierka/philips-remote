// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Session _$SessionFromJson(Map<String, dynamic> json) => Session(
      tv: TV.fromJson(json['tv'] as Map<String, dynamic>),
      credential: json['credential'] == null
          ? null
          : Credential.fromJson(json['credential'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SessionToJson(Session instance) => <String, dynamic>{
      'tv': instance.tv,
      'credential': instance.credential,
    };
