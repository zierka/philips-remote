import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:phimote/logic/services/logging/log.dart';
import 'package:phimote/logic/models/tv.dart';

part 'app_state.freezed.dart';

@freezed
abstract class AppState with _$AppState {
  const factory AppState.loading() = Loading;
  const factory AppState.content(TV tv) = Content;
  const factory AppState.landing() = Landing;
}
