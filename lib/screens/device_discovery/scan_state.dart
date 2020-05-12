import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:philips_remote/data/models/tv.dart';

part 'scan_state.freezed.dart';

@freezed
abstract class ScanState with _$ScanState {
  const factory ScanState.loading() = Loading;
  const factory ScanState.tvs(List<TV> tvs) = Data;
  // const factory ScanState.nothingFound() = Empty;
}
