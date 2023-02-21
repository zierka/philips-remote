// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'system.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

System _$SystemFromJson(Map<String, dynamic> json) => System(
      json['notifyChange'] as String,
      json['menulanguage'] as String,
      json['name'] as String,
      json['serialnumber_encrypted'] as String,
      json['model_encrypted'] as String,
      json['deviceid_encrypted'] as String,
      ApiVersion.fromJson(json['api_version'] as Map<String, dynamic>),
      Featuring.fromJson(json['featuring'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SystemToJson(System instance) => <String, dynamic>{
      'notifyChange': instance.notifyChange,
      'menulanguage': instance.menuLanguage,
      'name': instance.name,
      'serialnumber_encrypted': instance.serialNumberEncrypted,
      'model_encrypted': instance.modelEncrypted,
      'deviceid_encrypted': instance.deviceIdEncrypted,
      'api_version': instance.apiVersion,
      'featuring': instance.featuring,
    };

ApiVersion _$ApiVersionFromJson(Map<String, dynamic> json) => ApiVersion(
      json['Major'] as int,
      json['Minor'] as int,
      json['Patch'] as int,
    );

Map<String, dynamic> _$ApiVersionToJson(ApiVersion instance) =>
    <String, dynamic>{
      'Major': instance.major,
      'Minor': instance.minor,
      'Patch': instance.patch,
    };

Featuring _$FeaturingFromJson(Map<String, dynamic> json) => Featuring(
      JsonFeatures.fromJson(json['jsonfeatures'] as Map<String, dynamic>),
      SystemFeatures.fromJson(json['systemfeatures'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FeaturingToJson(Featuring instance) => <String, dynamic>{
      'jsonfeatures': instance.jsonFeatures,
      'systemfeatures': instance.systemFeatures,
    };

JsonFeatures _$JsonFeaturesFromJson(Map<String, dynamic> json) => JsonFeatures(
      (json['ambilight'] as List<dynamic>).map((e) => e as String).toList(),
      (json['textentry'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$JsonFeaturesToJson(JsonFeatures instance) =>
    <String, dynamic>{
      'ambilight': instance.ambilight,
      'textentry': instance.textEntry,
    };

SystemFeatures _$SystemFeaturesFromJson(Map<String, dynamic> json) =>
    SystemFeatures(
      json['pairing_type'] as String,
    );

Map<String, dynamic> _$SystemFeaturesToJson(SystemFeatures instance) =>
    <String, dynamic>{
      'pairing_type': instance.pairingType,
    };
