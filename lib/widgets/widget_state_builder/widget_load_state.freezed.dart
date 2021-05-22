// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'widget_load_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$WidgetLoadStateTearOff {
  const _$WidgetLoadStateTearOff();

  Content content() {
    return const Content();
  }

  ContentKeepLoading contentKeepLoading(Future<dynamic> until) {
    return ContentKeepLoading(
      until,
    );
  }

  Loading loading() {
    return const Loading();
  }

  Error error(ScreenError error) {
    return Error(
      error,
    );
  }

  Empty empty(EmptyStateData? data) {
    return Empty(
      data,
    );
  }
}

/// @nodoc
const $WidgetLoadState = _$WidgetLoadStateTearOff();

/// @nodoc
mixin _$WidgetLoadState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() content,
    required TResult Function(Future<dynamic> until) contentKeepLoading,
    required TResult Function() loading,
    required TResult Function(ScreenError error) error,
    required TResult Function(EmptyStateData? data) empty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? content,
    TResult Function(Future<dynamic> until)? contentKeepLoading,
    TResult Function()? loading,
    TResult Function(ScreenError error)? error,
    TResult Function(EmptyStateData? data)? empty,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Content value) content,
    required TResult Function(ContentKeepLoading value) contentKeepLoading,
    required TResult Function(Loading value) loading,
    required TResult Function(Error value) error,
    required TResult Function(Empty value) empty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Content value)? content,
    TResult Function(ContentKeepLoading value)? contentKeepLoading,
    TResult Function(Loading value)? loading,
    TResult Function(Error value)? error,
    TResult Function(Empty value)? empty,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WidgetLoadStateCopyWith<$Res> {
  factory $WidgetLoadStateCopyWith(
          WidgetLoadState value, $Res Function(WidgetLoadState) then) =
      _$WidgetLoadStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$WidgetLoadStateCopyWithImpl<$Res>
    implements $WidgetLoadStateCopyWith<$Res> {
  _$WidgetLoadStateCopyWithImpl(this._value, this._then);

  final WidgetLoadState _value;
  // ignore: unused_field
  final $Res Function(WidgetLoadState) _then;
}

/// @nodoc
abstract class $ContentCopyWith<$Res> {
  factory $ContentCopyWith(Content value, $Res Function(Content) then) =
      _$ContentCopyWithImpl<$Res>;
}

/// @nodoc
class _$ContentCopyWithImpl<$Res> extends _$WidgetLoadStateCopyWithImpl<$Res>
    implements $ContentCopyWith<$Res> {
  _$ContentCopyWithImpl(Content _value, $Res Function(Content) _then)
      : super(_value, (v) => _then(v as Content));

  @override
  Content get _value => super._value as Content;
}

/// @nodoc

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
  TResult when<TResult extends Object?>({
    required TResult Function() content,
    required TResult Function(Future<dynamic> until) contentKeepLoading,
    required TResult Function() loading,
    required TResult Function(ScreenError error) error,
    required TResult Function(EmptyStateData? data) empty,
  }) {
    return content();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? content,
    TResult Function(Future<dynamic> until)? contentKeepLoading,
    TResult Function()? loading,
    TResult Function(ScreenError error)? error,
    TResult Function(EmptyStateData? data)? empty,
    required TResult orElse(),
  }) {
    if (content != null) {
      return content();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Content value) content,
    required TResult Function(ContentKeepLoading value) contentKeepLoading,
    required TResult Function(Loading value) loading,
    required TResult Function(Error value) error,
    required TResult Function(Empty value) empty,
  }) {
    return content(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Content value)? content,
    TResult Function(ContentKeepLoading value)? contentKeepLoading,
    TResult Function(Loading value)? loading,
    TResult Function(Error value)? error,
    TResult Function(Empty value)? empty,
    required TResult orElse(),
  }) {
    if (content != null) {
      return content(this);
    }
    return orElse();
  }
}

abstract class Content implements WidgetLoadState {
  const factory Content() = _$Content;
}

/// @nodoc
abstract class $ContentKeepLoadingCopyWith<$Res> {
  factory $ContentKeepLoadingCopyWith(
          ContentKeepLoading value, $Res Function(ContentKeepLoading) then) =
      _$ContentKeepLoadingCopyWithImpl<$Res>;
  $Res call({Future<dynamic> until});
}

/// @nodoc
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
    Object? until = freezed,
  }) {
    return _then(ContentKeepLoading(
      until == freezed
          ? _value.until
          : until // ignore: cast_nullable_to_non_nullable
              as Future<dynamic>,
    ));
  }
}

/// @nodoc

class _$ContentKeepLoading implements ContentKeepLoading {
  const _$ContentKeepLoading(this.until);

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

  @JsonKey(ignore: true)
  @override
  $ContentKeepLoadingCopyWith<ContentKeepLoading> get copyWith =>
      _$ContentKeepLoadingCopyWithImpl<ContentKeepLoading>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() content,
    required TResult Function(Future<dynamic> until) contentKeepLoading,
    required TResult Function() loading,
    required TResult Function(ScreenError error) error,
    required TResult Function(EmptyStateData? data) empty,
  }) {
    return contentKeepLoading(until);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? content,
    TResult Function(Future<dynamic> until)? contentKeepLoading,
    TResult Function()? loading,
    TResult Function(ScreenError error)? error,
    TResult Function(EmptyStateData? data)? empty,
    required TResult orElse(),
  }) {
    if (contentKeepLoading != null) {
      return contentKeepLoading(until);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Content value) content,
    required TResult Function(ContentKeepLoading value) contentKeepLoading,
    required TResult Function(Loading value) loading,
    required TResult Function(Error value) error,
    required TResult Function(Empty value) empty,
  }) {
    return contentKeepLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Content value)? content,
    TResult Function(ContentKeepLoading value)? contentKeepLoading,
    TResult Function(Loading value)? loading,
    TResult Function(Error value)? error,
    TResult Function(Empty value)? empty,
    required TResult orElse(),
  }) {
    if (contentKeepLoading != null) {
      return contentKeepLoading(this);
    }
    return orElse();
  }
}

abstract class ContentKeepLoading implements WidgetLoadState {
  const factory ContentKeepLoading(Future<dynamic> until) =
      _$ContentKeepLoading;

  Future<dynamic> get until => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ContentKeepLoadingCopyWith<ContentKeepLoading> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoadingCopyWith<$Res> {
  factory $LoadingCopyWith(Loading value, $Res Function(Loading) then) =
      _$LoadingCopyWithImpl<$Res>;
}

/// @nodoc
class _$LoadingCopyWithImpl<$Res> extends _$WidgetLoadStateCopyWithImpl<$Res>
    implements $LoadingCopyWith<$Res> {
  _$LoadingCopyWithImpl(Loading _value, $Res Function(Loading) _then)
      : super(_value, (v) => _then(v as Loading));

  @override
  Loading get _value => super._value as Loading;
}

/// @nodoc

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
  TResult when<TResult extends Object?>({
    required TResult Function() content,
    required TResult Function(Future<dynamic> until) contentKeepLoading,
    required TResult Function() loading,
    required TResult Function(ScreenError error) error,
    required TResult Function(EmptyStateData? data) empty,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? content,
    TResult Function(Future<dynamic> until)? contentKeepLoading,
    TResult Function()? loading,
    TResult Function(ScreenError error)? error,
    TResult Function(EmptyStateData? data)? empty,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Content value) content,
    required TResult Function(ContentKeepLoading value) contentKeepLoading,
    required TResult Function(Loading value) loading,
    required TResult Function(Error value) error,
    required TResult Function(Empty value) empty,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Content value)? content,
    TResult Function(ContentKeepLoading value)? contentKeepLoading,
    TResult Function(Loading value)? loading,
    TResult Function(Error value)? error,
    TResult Function(Empty value)? empty,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class Loading implements WidgetLoadState {
  const factory Loading() = _$Loading;
}

/// @nodoc
abstract class $ErrorCopyWith<$Res> {
  factory $ErrorCopyWith(Error value, $Res Function(Error) then) =
      _$ErrorCopyWithImpl<$Res>;
  $Res call({ScreenError error});
}

/// @nodoc
class _$ErrorCopyWithImpl<$Res> extends _$WidgetLoadStateCopyWithImpl<$Res>
    implements $ErrorCopyWith<$Res> {
  _$ErrorCopyWithImpl(Error _value, $Res Function(Error) _then)
      : super(_value, (v) => _then(v as Error));

  @override
  Error get _value => super._value as Error;

  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(Error(
      error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as ScreenError,
    ));
  }
}

/// @nodoc

class _$Error implements Error {
  const _$Error(this.error);

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

  @JsonKey(ignore: true)
  @override
  $ErrorCopyWith<Error> get copyWith =>
      _$ErrorCopyWithImpl<Error>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() content,
    required TResult Function(Future<dynamic> until) contentKeepLoading,
    required TResult Function() loading,
    required TResult Function(ScreenError error) error,
    required TResult Function(EmptyStateData? data) empty,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? content,
    TResult Function(Future<dynamic> until)? contentKeepLoading,
    TResult Function()? loading,
    TResult Function(ScreenError error)? error,
    TResult Function(EmptyStateData? data)? empty,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Content value) content,
    required TResult Function(ContentKeepLoading value) contentKeepLoading,
    required TResult Function(Loading value) loading,
    required TResult Function(Error value) error,
    required TResult Function(Empty value) empty,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Content value)? content,
    TResult Function(ContentKeepLoading value)? contentKeepLoading,
    TResult Function(Loading value)? loading,
    TResult Function(Error value)? error,
    TResult Function(Empty value)? empty,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class Error implements WidgetLoadState {
  const factory Error(ScreenError error) = _$Error;

  ScreenError get error => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ErrorCopyWith<Error> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmptyCopyWith<$Res> {
  factory $EmptyCopyWith(Empty value, $Res Function(Empty) then) =
      _$EmptyCopyWithImpl<$Res>;
  $Res call({EmptyStateData? data});
}

/// @nodoc
class _$EmptyCopyWithImpl<$Res> extends _$WidgetLoadStateCopyWithImpl<$Res>
    implements $EmptyCopyWith<$Res> {
  _$EmptyCopyWithImpl(Empty _value, $Res Function(Empty) _then)
      : super(_value, (v) => _then(v as Empty));

  @override
  Empty get _value => super._value as Empty;

  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(Empty(
      data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as EmptyStateData?,
    ));
  }
}

/// @nodoc

class _$Empty implements Empty {
  const _$Empty(this.data);

  @override
  final EmptyStateData? data;

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

  @JsonKey(ignore: true)
  @override
  $EmptyCopyWith<Empty> get copyWith =>
      _$EmptyCopyWithImpl<Empty>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() content,
    required TResult Function(Future<dynamic> until) contentKeepLoading,
    required TResult Function() loading,
    required TResult Function(ScreenError error) error,
    required TResult Function(EmptyStateData? data) empty,
  }) {
    return empty(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? content,
    TResult Function(Future<dynamic> until)? contentKeepLoading,
    TResult Function()? loading,
    TResult Function(ScreenError error)? error,
    TResult Function(EmptyStateData? data)? empty,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Content value) content,
    required TResult Function(ContentKeepLoading value) contentKeepLoading,
    required TResult Function(Loading value) loading,
    required TResult Function(Error value) error,
    required TResult Function(Empty value) empty,
  }) {
    return empty(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Content value)? content,
    TResult Function(ContentKeepLoading value)? contentKeepLoading,
    TResult Function(Loading value)? loading,
    TResult Function(Error value)? error,
    TResult Function(Empty value)? empty,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }
}

abstract class Empty implements WidgetLoadState {
  const factory Empty(EmptyStateData? data) = _$Empty;

  EmptyStateData? get data => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EmptyCopyWith<Empty> get copyWith => throw _privateConstructorUsedError;
}
