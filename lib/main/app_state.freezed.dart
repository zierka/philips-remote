// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'app_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$AppStateTearOff {
  const _$AppStateTearOff();

  Loading loading() {
    return const Loading();
  }

  Content content(TV tv) {
    return Content(
      tv,
    );
  }

  Landing landing() {
    return const Landing();
  }
}

/// @nodoc
const $AppState = _$AppStateTearOff();

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
      _$AppStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$AppStateCopyWithImpl<$Res> implements $AppStateCopyWith<$Res> {
  _$AppStateCopyWithImpl(this._value, this._then);

  final AppState _value;
  // ignore: unused_field
  final $Res Function(AppState) _then;
}

/// @nodoc
abstract class $LoadingCopyWith<$Res> {
  factory $LoadingCopyWith(Loading value, $Res Function(Loading) then) =
      _$LoadingCopyWithImpl<$Res>;
}

/// @nodoc
class _$LoadingCopyWithImpl<$Res> extends _$AppStateCopyWithImpl<$Res>
    implements $LoadingCopyWith<$Res> {
  _$LoadingCopyWithImpl(Loading _value, $Res Function(Loading) _then)
      : super(_value, (v) => _then(v as Loading));

  @override
  Loading get _value => super._value as Loading;
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
    properties..add(DiagnosticsProperty('type', 'AppState.loading'));
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
    required TResult Function() loading,
    required TResult Function(TV tv) content,
    required TResult Function() landing,
  }) {
    return loading();
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
abstract class $ContentCopyWith<$Res> {
  factory $ContentCopyWith(Content value, $Res Function(Content) then) =
      _$ContentCopyWithImpl<$Res>;
  $Res call({TV tv});
}

/// @nodoc
class _$ContentCopyWithImpl<$Res> extends _$AppStateCopyWithImpl<$Res>
    implements $ContentCopyWith<$Res> {
  _$ContentCopyWithImpl(Content _value, $Res Function(Content) _then)
      : super(_value, (v) => _then(v as Content));

  @override
  Content get _value => super._value as Content;

  @override
  $Res call({
    Object? tv = freezed,
  }) {
    return _then(Content(
      tv == freezed
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
        (other is Content &&
            (identical(other.tv, tv) ||
                const DeepCollectionEquality().equals(other.tv, tv)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(tv);

  @JsonKey(ignore: true)
  @override
  $ContentCopyWith<Content> get copyWith =>
      _$ContentCopyWithImpl<Content>(this, _$identity);

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
  const factory Content(TV tv) = _$Content;

  TV get tv => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ContentCopyWith<Content> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LandingCopyWith<$Res> {
  factory $LandingCopyWith(Landing value, $Res Function(Landing) then) =
      _$LandingCopyWithImpl<$Res>;
}

/// @nodoc
class _$LandingCopyWithImpl<$Res> extends _$AppStateCopyWithImpl<$Res>
    implements $LandingCopyWith<$Res> {
  _$LandingCopyWithImpl(Landing _value, $Res Function(Landing) _then)
      : super(_value, (v) => _then(v as Landing));

  @override
  Landing get _value => super._value as Landing;
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
    properties..add(DiagnosticsProperty('type', 'AppState.landing'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is Landing);
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
