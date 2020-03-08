// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'application.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApplicationResponse _$ApplicationResponseFromJson(Map<String, dynamic> json) {
  return ApplicationResponse(
      version: json['version'] as int,
      applications: (json['applications'] as List)
          ?.map((e) => e == null
              ? null
              : Application.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$ApplicationResponseToJson(
        ApplicationResponse instance) =>
    <String, dynamic>{
      'version': instance.version,
      'applications': instance.applications
    };

Application _$ApplicationFromJson(Map<String, dynamic> json) {
  return Application(
      label: json['label'] as String,
      intent: json['intent'] == null
          ? null
          : Intent.fromJson(json['intent'] as Map<String, dynamic>),
      order: json['order'] as int,
      id: json['id'] as String,
      type: json['type'] as String);
}

Map<String, dynamic> _$ApplicationToJson(Application instance) =>
    <String, dynamic>{
      'label': instance.label,
      'intent': instance.intent,
      'order': instance.order,
      'id': instance.id,
      'type': instance.type
    };

Intent _$IntentFromJson(Map<String, dynamic> json) {
  return Intent(
      component: json['component'] == null
          ? null
          : Component.fromJson(json['component'] as Map<String, dynamic>),
      action: json['action'] as String);
}

Map<String, dynamic> _$IntentToJson(Intent instance) => <String, dynamic>{
      'component': instance.component,
      'action': instance.action
    };

Component _$ComponentFromJson(Map<String, dynamic> json) {
  return Component(
      packageName: json['packageName'] as String,
      className: json['className'] as String);
}

Map<String, dynamic> _$ComponentToJson(Component instance) => <String, dynamic>{
      'packageName': instance.packageName,
      'className': instance.className
    };
