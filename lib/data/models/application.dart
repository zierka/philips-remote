import 'package:json_annotation/json_annotation.dart';
import 'package:philips_remote/services/api/api.dart';

part 'application.g.dart';

@JsonSerializable()
class ApplicationResponse {
  final int version;
  final List<Application> applications;

  factory ApplicationResponse.fromJson(Map<String, dynamic> json) =>
      _$ApplicationResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ApplicationResponseToJson(this);

  ApplicationResponse({
    this.version,
    this.applications,
  });
}

@JsonSerializable()
class Application {
  final String label;
  final Intent intent;
  final int order;
  final String id;
  final String type;

  get logoUrl => API.baseUrl + "applications/$id/icon";

  factory Application.fromJson(Map<String, dynamic> json) =>
      _$ApplicationFromJson(json);
  Map<String, dynamic> toJson() => _$ApplicationToJson(this);

  Application({
    this.label,
    this.intent,
    this.order,
    this.id,
    this.type,
  });
}

@JsonSerializable()
class Intent {
  final Component component;
  final String action;

  factory Intent.fromJson(Map<String, dynamic> json) => _$IntentFromJson(json);
  Map<String, dynamic> toJson() => _$IntentToJson(this);

  Intent({
    this.component,
    this.action,
  });
}

@JsonSerializable()
class Component {
  final String packageName;
  final String className;

  factory Component.fromJson(Map<String, dynamic> json) =>
      _$ComponentFromJson(json);
  Map<String, dynamic> toJson() => _$ComponentToJson(this);

  Component({
    this.packageName,
    this.className,
  });
}
