// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'credential.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Credential _$CredentialFromJson(Map<String, dynamic> json) {
  return Credential(
    username: json['username'] as String,
    password: json['password'] as String,
  );
}

Map<String, dynamic> _$CredentialToJson(Credential instance) =>
    <String, dynamic>{
      'username': instance.username,
      'password': instance.password,
    };
