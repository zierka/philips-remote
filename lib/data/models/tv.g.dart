// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tv.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TV _$TVFromJson(Map<String, dynamic> json) {
  return TV(
      protocol: json['protocol'] as String,
      ip: json['ip'] as String,
      port: json['port'] as int,
      apiVersion: json['apiVersion'] as int,
      name: json['name'] as String,
      friendlyName: json['friendlyName'] as String);
}

Map<String, dynamic> _$TVToJson(TV instance) => <String, dynamic>{
      'protocol': instance.protocol,
      'ip': instance.ip,
      'port': instance.port,
      'apiVersion': instance.apiVersion,
      'name': instance.name,
      'friendlyName': instance.friendlyName
    };
