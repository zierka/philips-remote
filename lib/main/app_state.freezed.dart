// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'app_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AppState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(TV tv) content,
    required TResult Function() landing,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(TV tv)? content,
    TResult? Function()? landing,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(TV tv)? content,
    TResult Function()? landing,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Loading value) loading,
    required TResult Function(Content value) content,
    required TResult Function(Landing value) landing,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Loading value)? loading,
    TResult? Function(Content value)? content,
    TResult? Function(Landing value)? landing,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Loading value)? loading,
    TResult Function(Content value)? content,
    TResult Function(Landing value)? landing,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppStateCopyWith<$Res> {
  factory $AppStateCopyWith(AppState value, $Res Function(AppState) then) =
      _$AppStateCopyWithImpl<$Res, AppState>;
}

/// @nodoc
class _$AppStateCopyWithImpl<$Res, $Val extends AppState>
    implements $AppStateCopyWith<$Res> {
  _$AppStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$LoadingCopyWith<$Res> {
  factory _$$LoadingCopyWith(_$Loading value, $Res Function(_$Loading) then) =
      __$$LoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingCopyWithImpl<$Res>
    extends _$AppStateCopyWithImpl<$Res, _$Loading>
    implements _$$LoadingCopyWith<$Res> {
  __$$LoadingCopyWithImpl(_$Loading _value, $Res Function(_$Loading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$Loading with DiagnosticableTreeMixin implements Loading {
  const _$Loading();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AppState.loading()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'AppState.loading'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Loading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(TV tv) content,
    required TResult Function() landing,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(TV tv)? content,
    TResult? Function()? landing,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(TV tv)? content,
    TResult Function()? landing,
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
    required TResult Function(Loading value) loading,
    required TResult Function(Content value) content,
    required TResult Function(Landing value) landing,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Loading value)? loading,
    TResult? Function(Content value)? content,
    TResult? Function(Landing value)? landing,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Loading value)? loading,
    TResult Function(Content value)? content,
    TResult Function(Landing value)? landing,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class Loading implements AppState {
  const factory Loading() = _$Loading;
}

/// @nodoc
abstract class _$$ContentCopyWith<$Res> {
  factory _$$ContentCopyWith(_$Content value, $Res Function(_$Content) then) =
      __$$ContentCopyWithImpl<$Res>;
  @useResult
  $Res call({TV tv});
}

/// @nodoc
class __$$ContentCopyWithImpl<$Res>
    extends _$AppStateCopyWithImpl<$Res, _$Content>
    implements _$$ContentCopyWith<$Res> {
  __$$ContentCopyWithImpl(_$Content _value, $Res Function(_$Content) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tv = null,
  }) {
    return _then(_$Content(
      null == tv
          ? _value.tv
          : tv // ignore: cast_nullable_to_non_nullable
              as TV,
    ));
  }
}

/// @nodoc

class _$Content with DiagnosticableTreeMixin implements Content {
  const _$Content(this.tv);

  @override
  final TV tv;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AppState.content(tv: $tv)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AppState.content'))
      ..add(DiagnosticsProperty('tv', tv));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Content &&
            (identical(other.tv, tv) || other.tv == tv));
  }

  @override
  int get hashCode => Object.hash(runtimeType, tv);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ContentCopyWith<_$Content> get copyWith =>
      __$$ContentCopyWithImpl<_$Content>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(TV tv) content,
    required TResult Function() landing,
  }) {
    return content(tv);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(TV tv)? content,
    TResult? Function()? landing,
  }) {
    return content?.call(tv);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(TV tv)? content,
    TResult Function()? landing,
    required TResult orElse(),
  }) {
    if (content != null) {
      return content(tv);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Loading value) loading,
    required TResult Function(Content value) content,
    required TResult Function(Landing value) landing,
  }) {
    return content(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Loading value)? loading,
    TResult? Function(Content value)? content,
    TResult? Function(Landing value)? landing,
  }) {
    return content?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Loading value)? loading,
    TResult Function(Content value)? content,
    TResult Function(Landing value)? landing,
    required TResult orElse(),
  }) {
    if (content != null) {
      return content(this);
    }
    return orElse();
  }
}

abstract class Content implements AppState {
  const factory Content(final TV tv) = _$Content;

  TV get tv;
  @JsonKey(ignore: true)
  _$$ContentCopyWith<_$Content> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LandingCopyWith<$Res> {
  factory _$$LandingCopyWith(_$Landing value, $Res Function(_$Landing) then) =
      __$$LandingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LandingCopyWithImpl<$Res>
    extends _$AppStateCopyWithImpl<$Res, _$Landing>
    implements _$$LandingCopyWith<$Res> {
  __$$LandingCopyWithImpl(_$Landing _value, $Res Function(_$Landing) _then)
      : super(_value, _then);
}

/// @nodoc

class _$Landing with DiagnosticableTreeMixin implements Landing {
  const _$Landing();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AppState.landing()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'AppState.landing'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Landing);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(TV tv) content,
    required TResult Function() landing,
  }) {
    return landing();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(TV tv)? content,
    TResult? Function()? landing,
  }) {
    return landing?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(TV tv)? content,
    TResult Function()? landing,
    required TResult orElse(),
  }) {
    if (landing != null) {
      return landing();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Loading value) loading,
    required TResult Function(Content value) content,
    required TResult Function(Landing value) landing,
  }) {
    return landing(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Loading value)? loading,
    TResult? Function(Content value)? content,
    TResult? Function(Landing value)? landing,
  }) {
    return landing?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Loading value)? loading,
    TResult Function(Content value)? content,
    TResult Function(Landing value)? landing,
    required TResult orElse(),
  }) {
    if (landing != null) {
      return landing(this);
    }
    return orElse();
  }
}

abstract class Landing implements AppState {
  const factory Landing() = _$Landing;
}
