// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'scan_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$ScanStateTearOff {
  const _$ScanStateTearOff();

  Loading loading() {
    return const Loading();
  }

  Data tvs(List<dynamic> tvs) {
    return Data(
      tvs,
    );
  }
}

// ignore: unused_element
const $ScanState = _$ScanStateTearOff();

mixin _$ScanState {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result loading(),
    @required Result tvs(List<dynamic> tvs),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result loading(),
    Result tvs(List<dynamic> tvs),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result loading(Loading value),
    @required Result tvs(Data value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result loading(Loading value),
    Result tvs(Data value),
    @required Result orElse(),
  });
}

abstract class $ScanStateCopyWith<$Res> {
  factory $ScanStateCopyWith(ScanState value, $Res Function(ScanState) then) =
      _$ScanStateCopyWithImpl<$Res>;
}

class _$ScanStateCopyWithImpl<$Res> implements $ScanStateCopyWith<$Res> {
  _$ScanStateCopyWithImpl(this._value, this._then);

  final ScanState _value;
  // ignore: unused_field
  final $Res Function(ScanState) _then;
}

abstract class $LoadingCopyWith<$Res> {
  factory $LoadingCopyWith(Loading value, $Res Function(Loading) then) =
      _$LoadingCopyWithImpl<$Res>;
}

class _$LoadingCopyWithImpl<$Res> extends _$ScanStateCopyWithImpl<$Res>
    implements $LoadingCopyWith<$Res> {
  _$LoadingCopyWithImpl(Loading _value, $Res Function(Loading) _then)
      : super(_value, (v) => _then(v as Loading));

  @override
  Loading get _value => super._value as Loading;
}

class _$Loading with DiagnosticableTreeMixin implements Loading {
  const _$Loading();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ScanState.loading()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'ScanState.loading'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is Loading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result loading(),
    @required Result tvs(List<dynamic> tvs),
  }) {
    assert(loading != null);
    assert(tvs != null);
    return loading();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result loading(),
    Result tvs(List<dynamic> tvs),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result loading(Loading value),
    @required Result tvs(Data value),
  }) {
    assert(loading != null);
    assert(tvs != null);
    return loading(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result loading(Loading value),
    Result tvs(Data value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class Loading implements ScanState {
  const factory Loading() = _$Loading;
}

abstract class $DataCopyWith<$Res> {
  factory $DataCopyWith(Data value, $Res Function(Data) then) =
      _$DataCopyWithImpl<$Res>;
  $Res call({List<dynamic> tvs});
}

class _$DataCopyWithImpl<$Res> extends _$ScanStateCopyWithImpl<$Res>
    implements $DataCopyWith<$Res> {
  _$DataCopyWithImpl(Data _value, $Res Function(Data) _then)
      : super(_value, (v) => _then(v as Data));

  @override
  Data get _value => super._value as Data;

  @override
  $Res call({
    Object tvs = freezed,
  }) {
    return _then(Data(
      tvs == freezed ? _value.tvs : tvs as List<dynamic>,
    ));
  }
}

class _$Data with DiagnosticableTreeMixin implements Data {
  const _$Data(this.tvs) : assert(tvs != null);

  @override
  final List<dynamic> tvs;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ScanState.tvs(tvs: $tvs)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ScanState.tvs'))
      ..add(DiagnosticsProperty('tvs', tvs));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Data &&
            (identical(other.tvs, tvs) ||
                const DeepCollectionEquality().equals(other.tvs, tvs)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(tvs);

  @override
  $DataCopyWith<Data> get copyWith =>
      _$DataCopyWithImpl<Data>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result loading(),
    @required Result tvs(List<dynamic> tvs),
  }) {
    assert(loading != null);
    assert(tvs != null);
    return tvs(this.tvs);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result loading(),
    Result tvs(List<dynamic> tvs),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (tvs != null) {
      return tvs(this.tvs);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result loading(Loading value),
    @required Result tvs(Data value),
  }) {
    assert(loading != null);
    assert(tvs != null);
    return tvs(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result loading(Loading value),
    Result tvs(Data value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (tvs != null) {
      return tvs(this);
    }
    return orElse();
  }
}

abstract class Data implements ScanState {
  const factory Data(List<dynamic> tvs) = _$Data;

  List<dynamic> get tvs;
  $DataCopyWith<Data> get copyWith;
}
