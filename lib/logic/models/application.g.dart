// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'application.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApplicationResponse _$ApplicationResponseFromJson(Map<String, dynamic> json) {
  return ApplicationResponse(
    json['version'] as int,
    (json['applications'] as List<dynamic>)
        .map((e) => Application.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$ApplicationResponseToJson(
        ApplicationResponse instance) =>
    <String, dynamic>{
      'version': instance.version,
      'applications': instance.applications,
    };

Application _$ApplicationFromJson(Map<String, dynamic> json) {
  return Application(
    json['label'] as String,
    Intent.fromJson(json['intent'] as Map<String, dynamic>),
    json['order'] as int,
    json['id'] as String,
    json['type'] as String,
  );
}

Map<String, dynamic> _$ApplicationToJson(Application instance) =>
    <String, dynamic>{
      'label': instance.label,
      'intent': instance.intent,
      'order': instance.order,
      'id': instance.id,
      'type': instance.type,
    };

Intent _$IntentFromJson(Map<String, dynamic> json) {
  return Intent(
    Component.fromJson(json['component'] as Map<String, dynamic>),
    json['action'] as String,
  );
}

Map<String, dynamic> _$IntentToJson(Intent instance) => <String, dynamic>{
      'component': instance.component,
      'action': instance.action,
    };

Component _$ComponentFromJson(Map<String, dynamic> json) {
  return Component(
    json['packageName'] as String,
    json['className'] as String,
  );
}

Map<String, dynamic> _$ComponentToJson(Component instance) => <String, dynamic>{
      'packageName': instance.packageName,
      'className': instance.className,
    };
