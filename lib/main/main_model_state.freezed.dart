// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'main_model_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$MainModelStateTearOff {
  const _$MainModelStateTearOff();

// ignore: unused_element
  Loading loading() {
    return const Loading();
  }

// ignore: unused_element
  Content content(TV tv) {
    return Content(
      tv,
    );
  }

// ignore: unused_element
  Landing landing() {
    return const Landing();
  }
}

// ignore: unused_element
const $MainModelState = _$MainModelStateTearOff();

mixin _$MainModelState {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result loading(),
    @required Result content(TV tv),
    @required Result landing(),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result loading(),
    Result content(TV tv),
    Result landing(),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result loading(Loading value),
    @required Result content(Content value),
    @required Result landing(Landing value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result loading(Loading value),
    Result content(Content value),
    Result landing(Landing value),
    @required Result orElse(),
  });
}

abstract class $MainModelStateCopyWith<$Res> {
  factory $MainModelStateCopyWith(
          MainModelState value, $Res Function(MainModelState) then) =
      _$MainModelStateCopyWithImpl<$Res>;
}

class _$MainModelStateCopyWithImpl<$Res>
    implements $MainModelStateCopyWith<$Res> {
  _$MainModelStateCopyWithImpl(this._value, this._then);

  final MainModelState _value;
  // ignore: unused_field
  final $Res Function(MainModelState) _then;
}

abstract class $LoadingCopyWith<$Res> {
  factory $LoadingCopyWith(Loading value, $Res Function(Loading) then) =
      _$LoadingCopyWithImpl<$Res>;
}

class _$LoadingCopyWithImpl<$Res> extends _$MainModelStateCopyWithImpl<$Res>
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
    return 'MainModelState.loading()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'MainModelState.loading'));
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
    @required Result content(TV tv),
    @required Result landing(),
  }) {
    assert(loading != null);
    assert(content != null);
    assert(landing != null);
    return loading();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result loading(),
    Result content(TV tv),
    Result landing(),
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
    @required Result content(Content value),
    @required Result landing(Landing value),
  }) {
    assert(loading != null);
    assert(content != null);
    assert(landing != null);
    return loading(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result loading(Loading value),
    Result content(Content value),
    Result landing(Landing value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class Loading implements MainModelState {
  const factory Loading() = _$Loading;
}

abstract class $ContentCopyWith<$Res> {
  factory $ContentCopyWith(Content value, $Res Function(Content) then) =
      _$ContentCopyWithImpl<$Res>;
  $Res call({TV tv});
}

class _$ContentCopyWithImpl<$Res> extends _$MainModelStateCopyWithImpl<$Res>
    implements $ContentCopyWith<$Res> {
  _$ContentCopyWithImpl(Content _value, $Res Function(Content) _then)
      : super(_value, (v) => _then(v as Content));

  @override
  Content get _value => super._value as Content;

  @override
  $Res call({
    Object tv = freezed,
  }) {
    return _then(Content(
      tv == freezed ? _value.tv : tv as TV,
    ));
  }
}

class _$Content with DiagnosticableTreeMixin implements Content {
  const _$Content(this.tv) : assert(tv != null);

  @override
  final TV tv;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MainModelState.content(tv: $tv)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MainModelState.content'))
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

  @override
  $ContentCopyWith<Content> get copyWith =>
      _$ContentCopyWithImpl<Content>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result loading(),
    @required Result content(TV tv),
    @required Result landing(),
  }) {
    assert(loading != null);
    assert(content != null);
    assert(landing != null);
    return content(tv);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result loading(),
    Result content(TV tv),
    Result landing(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (content != null) {
      return content(tv);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result loading(Loading value),
    @required Result content(Content value),
    @required Result landing(Landing value),
  }) {
    assert(loading != null);
    assert(content != null);
    assert(landing != null);
    return content(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result loading(Loading value),
    Result content(Content value),
    Result landing(Landing value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (content != null) {
      return content(this);
    }
    return orElse();
  }
}

abstract class Content implements MainModelState {
  const factory Content(TV tv) = _$Content;

  TV get tv;
  $ContentCopyWith<Content> get copyWith;
}

abstract class $LandingCopyWith<$Res> {
  factory $LandingCopyWith(Landing value, $Res Function(Landing) then) =
      _$LandingCopyWithImpl<$Res>;
}

class _$LandingCopyWithImpl<$Res> extends _$MainModelStateCopyWithImpl<$Res>
    implements $LandingCopyWith<$Res> {
  _$LandingCopyWithImpl(Landing _value, $Res Function(Landing) _then)
      : super(_value, (v) => _then(v as Landing));

  @override
  Landing get _value => super._value as Landing;
}

class _$Landing with DiagnosticableTreeMixin implements Landing {
  const _$Landing();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MainModelState.landing()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'MainModelState.landing'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is Landing);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result loading(),
    @required Result content(TV tv),
    @required Result landing(),
  }) {
    assert(loading != null);
    assert(content != null);
    assert(landing != null);
    return landing();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result loading(),
    Result content(TV tv),
    Result landing(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (landing != null) {
      return landing();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result loading(Loading value),
    @required Result content(Content value),
    @required Result landing(Landing value),
  }) {
    assert(loading != null);
    assert(content != null);
    assert(landing != null);
    return landing(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result loading(Loading value),
    Result content(Content value),
    Result landing(Landing value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (landing != null) {
      return landing(this);
    }
    return orElse();
  }
}

abstract class Landing implements MainModelState {
  const factory Landing() = _$Landing;
}
