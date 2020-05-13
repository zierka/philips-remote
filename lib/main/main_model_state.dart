import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:philips_remote/data/models/tv.dart';

part 'main_model_state.freezed.dart';

@freezed
abstract class MainModelState with _$MainModelState {
  const factory MainModelState.loading() = Loading;
  const factory MainModelState.content(TV tv) = Content;
  const factory MainModelState.landing() = Landing;
}
