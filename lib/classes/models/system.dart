// import 'package:json_annotation/json_annotation.dart';

// part 'system.g.dart';

// @JsonSerializable()
// class System {
//   final String notifyChange;
//   final String menulanguage;
//   final String name;
//   final String country;
//   final String serialnumberEncrypted;
//   final String softwareversionEncrypted;
//   final String modelEncrypted;
//   final String deviceidEncrypted;
//   final String nettvversion;
//   final String epgsource;
//   final ApiVersion apiVersion;
//   final Featuring featuring;
//   final String osType;

//   System({
//     this.notifyChange,
//     this.menulanguage,
//     this.name,
//     this.country,
//     this.serialnumberEncrypted,
//     this.softwareversionEncrypted,
//     this.modelEncrypted,
//     this.deviceidEncrypted,
//     this.nettvversion,
//     this.epgsource,
//     this.apiVersion,
//     this.featuring,
//     this.osType,
//   });

//   factory System.fromJson(Map<String, dynamic> json) => _$SystemFromJson(json);
//   Map<String, dynamic> toJson() => _$SystemToJson(this);
// }

// @JsonSerializable()
// class ApiVersion {
//   final int major;
//   final int minor;
//   final int patch;

//   ApiVersion({
//     this.major,
//     this.minor,
//     this.patch,
//   });

//   factory ApiVersion.fromJson(Map<String, dynamic> json) =>
//       _$ApiVersionFromJson(json);
//   Map<String, dynamic> toJson() => _$ApiVersionToJson(this);
// }

// @JsonSerializable()
// class Featuring {
//   final Jsonfeatures jsonfeatures;
//   final Systemfeatures systemfeatures;

//   Featuring({
//     this.jsonfeatures,
//     this.systemfeatures,
//   });
// }

// @JsonSerializable()
// class Jsonfeatures {
//   final List<String> editfavorites;
//   final List<String> recordings;
//   final List<String> ambilight;
//   final List<String> menuitems;
//   final List<String> textentry;
//   final List<String> applications;
//   final List<String> pointer;
//   final List<String> inputkey;
//   final List<String> activities;
//   final List<String> channels;
//   final List<String> mappings;

//   Jsonfeatures({
//     this.editfavorites,
//     this.recordings,
//     this.ambilight,
//     this.menuitems,
//     this.textentry,
//     this.applications,
//     this.pointer,
//     this.inputkey,
//     this.activities,
//     this.channels,
//     this.mappings,
//   });
// }

// @JsonSerializable()
// class Systemfeatures {
//   final String tvtype;
//   final List<String> content;
//   final String tvsearch;
//   final String pairingType;
//   final String securedTransport;
//   final String companionScreen;

//   Systemfeatures({
//     this.tvtype,
//     this.content,
//     this.tvsearch,
//     this.pairingType,
//     this.securedTransport,
//     this.companionScreen,
//   });
// }
