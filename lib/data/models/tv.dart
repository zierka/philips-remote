import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'tv.g.dart';

@JsonSerializable()
class TV {
  String protocol;
  String ip;
  int port;
  int apiVersion;

  String name;
  String friendlyName;

  get baseUrl =>
      protocol +
      "://" +
      ip +
      ":" +
      port.toString() +
      "/" +
      apiVersion.toString() +
      "/";

  TV({
    @required this.protocol,
    @required this.ip,
    @required this.port,
    @required this.apiVersion,
    @required this.name,
    @required this.friendlyName,
  });

  factory TV.fromJson(Map<String, dynamic> json) => _$TVFromJson(json);
  Map<String, dynamic> toJson() => _$TVToJson(this);
}

class TVCandidate {
  String ip;
  String name;
  String friendlyName;

  TVCandidate({this.ip, this.name, this.friendlyName});
}

class TVCandidate2 {
  String ip;
  int port;

  TVCandidate2({this.ip, this.port});
}
