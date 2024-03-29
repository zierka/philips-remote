import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:phimote/logic/models/tv.dart';

part 'scan_state.freezed.dart';

@freezed
abstract class ScanState with _$ScanState {
  const factory ScanState.loading() = Loading;
  const factory ScanState.tvs(List<TV> tvs) = Data;
}
