// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'password_icon_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PasswordIconState {
  String get iconPath => throw _privateConstructorUsedError;
  bool get isClosed => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String iconPath, bool isClosed) shownIcon,
    required TResult Function(String iconPath, bool isClosed) closedIcon,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String iconPath, bool isClosed)? shownIcon,
    TResult? Function(String iconPath, bool isClosed)? closedIcon,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String iconPath, bool isClosed)? shownIcon,
    TResult Function(String iconPath, bool isClosed)? closedIcon,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ShownIcon value) shownIcon,
    required TResult Function(_ClosedIcon value) closedIcon,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ShownIcon value)? shownIcon,
    TResult? Function(_ClosedIcon value)? closedIcon,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ShownIcon value)? shownIcon,
    TResult Function(_ClosedIcon value)? closedIcon,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PasswordIconStateCopyWith<PasswordIconState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PasswordIconStateCopyWith<$Res> {
  factory $PasswordIconStateCopyWith(
          PasswordIconState value, $Res Function(PasswordIconState) then) =
      _$PasswordIconStateCopyWithImpl<$Res, PasswordIconState>;
  @useResult
  $Res call({String iconPath, bool isClosed});
}

/// @nodoc
class _$PasswordIconStateCopyWithImpl<$Res, $Val extends PasswordIconState>
    implements $PasswordIconStateCopyWith<$Res> {
  _$PasswordIconStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? iconPath = null,
    Object? isClosed = null,
  }) {
    return _then(_value.copyWith(
      iconPath: null == iconPath
          ? _value.iconPath
          : iconPath // ignore: cast_nullable_to_non_nullable
              as String,
      isClosed: null == isClosed
          ? _value.isClosed
          : isClosed // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ShownIconImplCopyWith<$Res>
    implements $PasswordIconStateCopyWith<$Res> {
  factory _$$ShownIconImplCopyWith(
          _$ShownIconImpl value, $Res Function(_$ShownIconImpl) then) =
      __$$ShownIconImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String iconPath, bool isClosed});
}

/// @nodoc
class __$$ShownIconImplCopyWithImpl<$Res>
    extends _$PasswordIconStateCopyWithImpl<$Res, _$ShownIconImpl>
    implements _$$ShownIconImplCopyWith<$Res> {
  __$$ShownIconImplCopyWithImpl(
      _$ShownIconImpl _value, $Res Function(_$ShownIconImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? iconPath = null,
    Object? isClosed = null,
  }) {
    return _then(_$ShownIconImpl(
      null == iconPath
          ? _value.iconPath
          : iconPath // ignore: cast_nullable_to_non_nullable
              as String,
      null == isClosed
          ? _value.isClosed
          : isClosed // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ShownIconImpl implements _ShownIcon {
  const _$ShownIconImpl(this.iconPath, this.isClosed);

  @override
  final String iconPath;
  @override
  final bool isClosed;

  @override
  String toString() {
    return 'PasswordIconState.shownIcon(iconPath: $iconPath, isClosed: $isClosed)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShownIconImpl &&
            (identical(other.iconPath, iconPath) ||
                other.iconPath == iconPath) &&
            (identical(other.isClosed, isClosed) ||
                other.isClosed == isClosed));
  }

  @override
  int get hashCode => Object.hash(runtimeType, iconPath, isClosed);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ShownIconImplCopyWith<_$ShownIconImpl> get copyWith =>
      __$$ShownIconImplCopyWithImpl<_$ShownIconImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String iconPath, bool isClosed) shownIcon,
    required TResult Function(String iconPath, bool isClosed) closedIcon,
  }) {
    return shownIcon(iconPath, isClosed);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String iconPath, bool isClosed)? shownIcon,
    TResult? Function(String iconPath, bool isClosed)? closedIcon,
  }) {
    return shownIcon?.call(iconPath, isClosed);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String iconPath, bool isClosed)? shownIcon,
    TResult Function(String iconPath, bool isClosed)? closedIcon,
    required TResult orElse(),
  }) {
    if (shownIcon != null) {
      return shownIcon(iconPath, isClosed);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ShownIcon value) shownIcon,
    required TResult Function(_ClosedIcon value) closedIcon,
  }) {
    return shownIcon(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ShownIcon value)? shownIcon,
    TResult? Function(_ClosedIcon value)? closedIcon,
  }) {
    return shownIcon?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ShownIcon value)? shownIcon,
    TResult Function(_ClosedIcon value)? closedIcon,
    required TResult orElse(),
  }) {
    if (shownIcon != null) {
      return shownIcon(this);
    }
    return orElse();
  }
}

abstract class _ShownIcon implements PasswordIconState {
  const factory _ShownIcon(final String iconPath, final bool isClosed) =
      _$ShownIconImpl;

  @override
  String get iconPath;
  @override
  bool get isClosed;
  @override
  @JsonKey(ignore: true)
  _$$ShownIconImplCopyWith<_$ShownIconImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ClosedIconImplCopyWith<$Res>
    implements $PasswordIconStateCopyWith<$Res> {
  factory _$$ClosedIconImplCopyWith(
          _$ClosedIconImpl value, $Res Function(_$ClosedIconImpl) then) =
      __$$ClosedIconImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String iconPath, bool isClosed});
}

/// @nodoc
class __$$ClosedIconImplCopyWithImpl<$Res>
    extends _$PasswordIconStateCopyWithImpl<$Res, _$ClosedIconImpl>
    implements _$$ClosedIconImplCopyWith<$Res> {
  __$$ClosedIconImplCopyWithImpl(
      _$ClosedIconImpl _value, $Res Function(_$ClosedIconImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? iconPath = null,
    Object? isClosed = null,
  }) {
    return _then(_$ClosedIconImpl(
      null == iconPath
          ? _value.iconPath
          : iconPath // ignore: cast_nullable_to_non_nullable
              as String,
      null == isClosed
          ? _value.isClosed
          : isClosed // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ClosedIconImpl implements _ClosedIcon {
  const _$ClosedIconImpl(this.iconPath, this.isClosed);

  @override
  final String iconPath;
  @override
  final bool isClosed;

  @override
  String toString() {
    return 'PasswordIconState.closedIcon(iconPath: $iconPath, isClosed: $isClosed)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClosedIconImpl &&
            (identical(other.iconPath, iconPath) ||
                other.iconPath == iconPath) &&
            (identical(other.isClosed, isClosed) ||
                other.isClosed == isClosed));
  }

  @override
  int get hashCode => Object.hash(runtimeType, iconPath, isClosed);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ClosedIconImplCopyWith<_$ClosedIconImpl> get copyWith =>
      __$$ClosedIconImplCopyWithImpl<_$ClosedIconImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String iconPath, bool isClosed) shownIcon,
    required TResult Function(String iconPath, bool isClosed) closedIcon,
  }) {
    return closedIcon(iconPath, isClosed);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String iconPath, bool isClosed)? shownIcon,
    TResult? Function(String iconPath, bool isClosed)? closedIcon,
  }) {
    return closedIcon?.call(iconPath, isClosed);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String iconPath, bool isClosed)? shownIcon,
    TResult Function(String iconPath, bool isClosed)? closedIcon,
    required TResult orElse(),
  }) {
    if (closedIcon != null) {
      return closedIcon(iconPath, isClosed);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ShownIcon value) shownIcon,
    required TResult Function(_ClosedIcon value) closedIcon,
  }) {
    return closedIcon(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ShownIcon value)? shownIcon,
    TResult? Function(_ClosedIcon value)? closedIcon,
  }) {
    return closedIcon?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ShownIcon value)? shownIcon,
    TResult Function(_ClosedIcon value)? closedIcon,
    required TResult orElse(),
  }) {
    if (closedIcon != null) {
      return closedIcon(this);
    }
    return orElse();
  }
}

abstract class _ClosedIcon implements PasswordIconState {
  const factory _ClosedIcon(final String iconPath, final bool isClosed) =
      _$ClosedIconImpl;

  @override
  String get iconPath;
  @override
  bool get isClosed;
  @override
  @JsonKey(ignore: true)
  _$$ClosedIconImplCopyWith<_$ClosedIconImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
