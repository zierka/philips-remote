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

  String get baseUrl =>
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

  @override
  String toString() {
    return 'TV(protocol: $protocol, ip: $ip, port: $port, apiVersion: $apiVersion, name: $name, friendlyName: $friendlyName)';
  }

  TV copyWith({
    String protocol,
    String ip,
    int port,
    int apiVersion,
    String name,
    String friendlyName,
  }) {
    return TV(
      protocol: protocol ?? this.protocol,
      ip: ip ?? this.ip,
      port: port ?? this.port,
      apiVersion: apiVersion ?? this.apiVersion,
      name: name ?? this.name,
      friendlyName: friendlyName ?? this.friendlyName,
    );
  }
}

class TVCandidate {
  String ip;
  String name;
  String friendlyName;

  TVCandidate({this.ip, this.name, this.friendlyName});

  @override
  String toString() =>
      'TVCandidate(ip: $ip, name: $name, friendlyName: $friendlyName)';
}

class TVCandidate2 {
  String ip;
  int port;

  TVCandidate2({this.ip, this.port});

  @override
  String toString() => 'TVCandidate2(ip: $ip, port: $port)';
}
