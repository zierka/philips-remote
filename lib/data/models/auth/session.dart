import 'package:json_annotation/json_annotation.dart';
import 'package:philips_remote/data/models/auth/credential.dart';
import 'package:philips_remote/data/models/tv.dart';

part 'session.g.dart';

@JsonSerializable()
class Session {
  final TV tv;
  final Credential credential;

  Session({this.tv, this.credential});

  factory Session.fromJson(Map<String, dynamic> json) =>
      _$SessionFromJson(json);
  Map<String, dynamic> toJson() => _$SessionToJson(this);
}
