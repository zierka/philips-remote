import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'system.g.dart';

@JsonSerializable()
class System {
  final String notifyChange;
  @JsonKey(name: "menulanguage")
  final String menuLanguage;
  final String name;
  @JsonKey(name: "serialnumber_encrypted")
  final String serialNumberEncrypted;
  @JsonKey(name: "model_encrypted")
  final String modelEncrypted;
  @JsonKey(name: "deviceid_encrypted")
  final String deviceIdEncrypted;
  @JsonKey(name: "api_version")
  final ApiVersion apiVersion;
  final Featuring featuring;

  factory System.fromJson(Map<String, dynamic> json) => _$SystemFromJson(json);
  Map<String, dynamic> toJson() => _$SystemToJson(this);

  System(
    this.notifyChange,
    this.menuLanguage,
    this.name,
    this.serialNumberEncrypted,
    this.modelEncrypted,
    this.deviceIdEncrypted,
    this.apiVersion,
    this.featuring,
  );
}

@JsonSerializable()
class ApiVersion {
  @JsonKey(name: "Major")
  final int major;
  @JsonKey(name: "Minor")
  final int minor;
  @JsonKey(name: "Patch")
  final int patch;

  factory ApiVersion.fromJson(Map<String, dynamic> json) =>
      _$ApiVersionFromJson(json);
  Map<String, dynamic> toJson() => _$ApiVersionToJson(this);

  ApiVersion(this.major, this.minor, this.patch);
}

@JsonSerializable()
class Featuring {
  @JsonKey(name: "jsonfeatures")
  final JsonFeatures jsonFeatures;
  @JsonKey(name: "systemfeatures")
  final SystemFeatures systemFeatures;

  factory Featuring.fromJson(Map<String, dynamic> json) =>
      _$FeaturingFromJson(json);
  Map<String, dynamic> toJson() => _$FeaturingToJson(this);

  Featuring(this.jsonFeatures, this.systemFeatures);
}

@JsonSerializable()
class JsonFeatures {
  final List<String> ambilight;
  @JsonKey(name: "textentry")
  final List<String> textEntry;

  factory JsonFeatures.fromJson(Map<String, dynamic> json) =>
      _$JsonFeaturesFromJson(json);
  Map<String, dynamic> toJson() => _$JsonFeaturesToJson(this);

  JsonFeatures(this.ambilight, this.textEntry);
}

@JsonSerializable()
class SystemFeatures {
  @JsonKey(name: "pairing_type")
  final String pairingType;

  factory SystemFeatures.fromJson(Map<String, dynamic> json) =>
      _$SystemFeaturesFromJson(json);
  Map<String, dynamic> toJson() => _$SystemFeaturesToJson(this);

  SystemFeatures(this.pairingType);
}
