// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'widget_load_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$WidgetLoadStateTearOff {
  const _$WidgetLoadStateTearOff();

// ignore: unused_element
  Content content() {
    return const Content();
  }

// ignore: unused_element
  ContentKeepLoading contentKeepLoading(Future<dynamic> until) {
    return ContentKeepLoading(
      until,
    );
  }

// ignore: unused_element
  Loading loading() {
    return const Loading();
  }

// ignore: unused_element
  Error error(ScreenError error) {
    return Error(
      error,
    );
  }

// ignore: unused_element
  Empty empty([EmptyStateData data]) {
    return Empty(
      data,
    );
  }
}

// ignore: unused_element
const $WidgetLoadState = _$WidgetLoadStateTearOff();

mixin _$WidgetLoadState {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result content(),
    @required Result contentKeepLoading(Future<dynamic> until),
    @required Result loading(),
    @required Result error(ScreenError error),
    @required Result empty(EmptyStateData data),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result content(),
    Result contentKeepLoading(Future<dynamic> until),
    Result loading(),
    Result error(ScreenError error),
    Result empty(EmptyStateData data),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result content(Content value),
    @required Result contentKeepLoading(ContentKeepLoading value),
    @required Result loading(Loading value),
    @required Result error(Error value),
    @required Result empty(Empty value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result content(Content value),
    Result contentKeepLoading(ContentKeepLoading value),
    Result loading(Loading value),
    Result error(Error value),
    Result empty(Empty value),
    @required Result orElse(),
  });
}

abstract class $WidgetLoadStateCopyWith<$Res> {
  factory $WidgetLoadStateCopyWith(
          WidgetLoadState value, $Res Function(WidgetLoadState) then) =
      _$WidgetLoadStateCopyWithImpl<$Res>;
}

class _$WidgetLoadStateCopyWithImpl<$Res>
    implements $WidgetLoadStateCopyWith<$Res> {
  _$WidgetLoadStateCopyWithImpl(this._value, this._then);

  final WidgetLoadState _value;
  // ignore: unused_field
  final $Res Function(WidgetLoadState) _then;
}

abstract class $ContentCopyWith<$Res> {
  factory $ContentCopyWith(Content value, $Res Function(Content) then) =
      _$ContentCopyWithImpl<$Res>;
}

class _$ContentCopyWithImpl<$Res> extends _$WidgetLoadStateCopyWithImpl<$Res>
    implements $ContentCopyWith<$Res> {
  _$ContentCopyWithImpl(Content _value, $Res Function(Content) _then)
      : super(_value, (v) => _then(v as Content));

  @override
  Content get _value => super._value as Content;
}

class _$Content implements Content {
  const _$Content();

  @override
  String toString() {
    return 'WidgetLoadState.content()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is Content);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result content(),
    @required Result contentKeepLoading(Future<dynamic> until),
    @required Result loading(),
    @required Result error(ScreenError error),
    @required Result empty(EmptyStateData data),
  }) {
    assert(content != null);
    assert(contentKeepLoading != null);
    assert(loading != null);
    assert(error != null);
    assert(empty != null);
    return content();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result content(),
    Result contentKeepLoading(Future<dynamic> until),
    Result loading(),
    Result error(ScreenError error),
    Result empty(EmptyStateData data),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (content != null) {
      return content();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result content(Content value),
    @required Result contentKeepLoading(ContentKeepLoading value),
    @required Result loading(Loading value),
    @required Result error(Error value),
    @required Result empty(Empty value),
  }) {
    assert(content != null);
    assert(contentKeepLoading != null);
    assert(loading != null);
    assert(error != null);
    assert(empty != null);
    return content(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result content(Content value),
    Result contentKeepLoading(ContentKeepLoading value),
    Result loading(Loading value),
    Result error(Error value),
    Result empty(Empty value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (content != null) {
      return content(this);
    }
    return orElse();
  }
}

abstract class Content implements WidgetLoadState {
  const factory Content() = _$Content;
}

abstract class $ContentKeepLoadingCopyWith<$Res> {
  factory $ContentKeepLoadingCopyWith(
          ContentKeepLoading value, $Res Function(ContentKeepLoading) then) =
      _$ContentKeepLoadingCopyWithImpl<$Res>;
  $Res call({Future<dynamic> until});
}

class _$ContentKeepLoadingCopyWithImpl<$Res>
    extends _$WidgetLoadStateCopyWithImpl<$Res>
    implements $ContentKeepLoadingCopyWith<$Res> {
  _$ContentKeepLoadingCopyWithImpl(
      ContentKeepLoading _value, $Res Function(ContentKeepLoading) _then)
      : super(_value, (v) => _then(v as ContentKeepLoading));

  @override
  ContentKeepLoading get _value => super._value as ContentKeepLoading;

  @override
  $Res call({
    Object until = freezed,
  }) {
    return _then(ContentKeepLoading(
      until == freezed ? _value.until : until as Future<dynamic>,
    ));
  }
}

class _$ContentKeepLoading implements ContentKeepLoading {
  const _$ContentKeepLoading(this.until) : assert(until != null);

  @override
  final Future<dynamic> until;

  @override
  String toString() {
    return 'WidgetLoadState.contentKeepLoading(until: $until)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ContentKeepLoading &&
            (identical(other.until, until) ||
                const DeepCollectionEquality().equals(other.until, until)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(until);

  @override
  $ContentKeepLoadingCopyWith<ContentKeepLoading> get copyWith =>
      _$ContentKeepLoadingCopyWithImpl<ContentKeepLoading>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result content(),
    @required Result contentKeepLoading(Future<dynamic> until),
    @required Result loading(),
    @required Result error(ScreenError error),
    @required Result empty(EmptyStateData data),
  }) {
    assert(content != null);
    assert(contentKeepLoading != null);
    assert(loading != null);
    assert(error != null);
    assert(empty != null);
    return contentKeepLoading(until);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result content(),
    Result contentKeepLoading(Future<dynamic> until),
    Result loading(),
    Result error(ScreenError error),
    Result empty(EmptyStateData data),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (contentKeepLoading != null) {
      return contentKeepLoading(until);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result content(Content value),
    @required Result contentKeepLoading(ContentKeepLoading value),
    @required Result loading(Loading value),
    @required Result error(Error value),
    @required Result empty(Empty value),
  }) {
    assert(content != null);
    assert(contentKeepLoading != null);
    assert(loading != null);
    assert(error != null);
    assert(empty != null);
    return contentKeepLoading(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result content(Content value),
    Result contentKeepLoading(ContentKeepLoading value),
    Result loading(Loading value),
    Result error(Error value),
    Result empty(Empty value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (contentKeepLoading != null) {
      return contentKeepLoading(this);
    }
    return orElse();
  }
}

abstract class ContentKeepLoading implements WidgetLoadState {
  const factory ContentKeepLoading(Future<dynamic> until) =
      _$ContentKeepLoading;

  Future<dynamic> get until;
  $ContentKeepLoadingCopyWith<ContentKeepLoading> get copyWith;
}

abstract class $LoadingCopyWith<$Res> {
  factory $LoadingCopyWith(Loading value, $Res Function(Loading) then) =
      _$LoadingCopyWithImpl<$Res>;
}

class _$LoadingCopyWithImpl<$Res> extends _$WidgetLoadStateCopyWithImpl<$Res>
    implements $LoadingCopyWith<$Res> {
  _$LoadingCopyWithImpl(Loading _value, $Res Function(Loading) _then)
      : super(_value, (v) => _then(v as Loading));

  @override
  Loading get _value => super._value as Loading;
}

class _$Loading implements Loading {
  const _$Loading();

  @override
  String toString() {
    return 'WidgetLoadState.loading()';
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
    @required Result content(),
    @required Result contentKeepLoading(Future<dynamic> until),
    @required Result loading(),
    @required Result error(ScreenError error),
    @required Result empty(EmptyStateData data),
  }) {
    assert(content != null);
    assert(contentKeepLoading != null);
    assert(loading != null);
    assert(error != null);
    assert(empty != null);
    return loading();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result content(),
    Result contentKeepLoading(Future<dynamic> until),
    Result loading(),
    Result error(ScreenError error),
    Result empty(EmptyStateData data),
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
    @required Result content(Content value),
    @required Result contentKeepLoading(ContentKeepLoading value),
    @required Result loading(Loading value),
    @required Result error(Error value),
    @required Result empty(Empty value),
  }) {
    assert(content != null);
    assert(contentKeepLoading != null);
    assert(loading != null);
    assert(error != null);
    assert(empty != null);
    return loading(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result content(Content value),
    Result contentKeepLoading(ContentKeepLoading value),
    Result loading(Loading value),
    Result error(Error value),
    Result empty(Empty value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class Loading implements WidgetLoadState {
  const factory Loading() = _$Loading;
}

abstract class $ErrorCopyWith<$Res> {
  factory $ErrorCopyWith(Error value, $Res Function(Error) then) =
      _$ErrorCopyWithImpl<$Res>;
  $Res call({ScreenError error});
}

class _$ErrorCopyWithImpl<$Res> extends _$WidgetLoadStateCopyWithImpl<$Res>
    implements $ErrorCopyWith<$Res> {
  _$ErrorCopyWithImpl(Error _value, $Res Function(Error) _then)
      : super(_value, (v) => _then(v as Error));

  @override
  Error get _value => super._value as Error;

  @override
  $Res call({
    Object error = freezed,
  }) {
    return _then(Error(
      error == freezed ? _value.error : error as ScreenError,
    ));
  }
}

class _$Error implements Error {
  const _$Error(this.error) : assert(error != null);

  @override
  final ScreenError error;

  @override
  String toString() {
    return 'WidgetLoadState.error(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Error &&
            (identical(other.error, error) ||
                const DeepCollectionEquality().equals(other.error, error)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(error);

  @override
  $ErrorCopyWith<Error> get copyWith =>
      _$ErrorCopyWithImpl<Error>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result content(),
    @required Result contentKeepLoading(Future<dynamic> until),
    @required Result loading(),
    @required Result error(ScreenError error),
    @required Result empty(EmptyStateData data),
  }) {
    assert(content != null);
    assert(contentKeepLoading != null);
    assert(loading != null);
    assert(error != null);
    assert(empty != null);
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result content(),
    Result contentKeepLoading(Future<dynamic> until),
    Result loading(),
    Result error(ScreenError error),
    Result empty(EmptyStateData data),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result content(Content value),
    @required Result contentKeepLoading(ContentKeepLoading value),
    @required Result loading(Loading value),
    @required Result error(Error value),
    @required Result empty(Empty value),
  }) {
    assert(content != null);
    assert(contentKeepLoading != null);
    assert(loading != null);
    assert(error != null);
    assert(empty != null);
    return error(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result content(Content value),
    Result contentKeepLoading(ContentKeepLoading value),
    Result loading(Loading value),
    Result error(Error value),
    Result empty(Empty value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class Error implements WidgetLoadState {
  const factory Error(ScreenError error) = _$Error;

  ScreenError get error;
  $ErrorCopyWith<Error> get copyWith;
}

abstract class $EmptyCopyWith<$Res> {
  factory $EmptyCopyWith(Empty value, $Res Function(Empty) then) =
      _$EmptyCopyWithImpl<$Res>;
  $Res call({EmptyStateData data});
}

class _$EmptyCopyWithImpl<$Res> extends _$WidgetLoadStateCopyWithImpl<$Res>
    implements $EmptyCopyWith<$Res> {
  _$EmptyCopyWithImpl(Empty _value, $Res Function(Empty) _then)
      : super(_value, (v) => _then(v as Empty));

  @override
  Empty get _value => super._value as Empty;

  @override
  $Res call({
    Object data = freezed,
  }) {
    return _then(Empty(
      data == freezed ? _value.data : data as EmptyStateData,
    ));
  }
}

class _$Empty implements Empty {
  const _$Empty([this.data]);

  @override
  final EmptyStateData data;

  @override
  String toString() {
    return 'WidgetLoadState.empty(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Empty &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(data);

  @override
  $EmptyCopyWith<Empty> get copyWith =>
      _$EmptyCopyWithImpl<Empty>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result content(),
    @required Result contentKeepLoading(Future<dynamic> until),
    @required Result loading(),
    @required Result error(ScreenError error),
    @required Result empty(EmptyStateData data),
  }) {
    assert(content != null);
    assert(contentKeepLoading != null);
    assert(loading != null);
    assert(error != null);
    assert(empty != null);
    return empty(data);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result content(),
    Result contentKeepLoading(Future<dynamic> until),
    Result loading(),
    Result error(ScreenError error),
    Result empty(EmptyStateData data),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (empty != null) {
      return empty(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result content(Content value),
    @required Result contentKeepLoading(ContentKeepLoading value),
    @required Result loading(Loading value),
    @required Result error(Error value),
    @required Result empty(Empty value),
  }) {
    assert(content != null);
    assert(contentKeepLoading != null);
    assert(loading != null);
    assert(error != null);
    assert(empty != null);
    return empty(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result content(Content value),
    Result contentKeepLoading(ContentKeepLoading value),
    Result loading(Loading value),
    Result error(Error value),
    Result empty(Empty value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }
}

abstract class Empty implements WidgetLoadState {
  const factory Empty([EmptyStateData data]) = _$Empty;

  EmptyStateData get data;
  $EmptyCopyWith<Empty> get copyWith;
}
