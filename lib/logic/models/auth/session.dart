import 'package:json_annotation/json_annotation.dart';
import 'package:phimote/logic/models/auth/credential.dart';
import 'package:phimote/logic/models/tv.dart';

part 'session.g.dart';

@JsonSerializable()
class Session {
  final TV tv;
  final Credential? credential;

  Session({required this.tv, this.credential});

  factory Session.fromJson(Map<String, dynamic> json) =>
      _$SessionFromJson(json);
  Map<String, dynamic> toJson() => _$SessionToJson(this);
}
