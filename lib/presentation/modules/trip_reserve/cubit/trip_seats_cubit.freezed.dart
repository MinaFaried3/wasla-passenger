// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'trip_seats_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TripSeatsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<SeatModel> seats) getTripSeatsSuccess,
    required TResult Function(String message) getTripSeatsFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<SeatModel> seats)? getTripSeatsSuccess,
    TResult? Function(String message)? getTripSeatsFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<SeatModel> seats)? getTripSeatsSuccess,
    TResult Function(String message)? getTripSeatsFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_loading value) loading,
    required TResult Function(_getTripSeatsSuccess value) getTripSeatsSuccess,
    required TResult Function(_getTripSeatsFailure value) getTripSeatsFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_loading value)? loading,
    TResult? Function(_getTripSeatsSuccess value)? getTripSeatsSuccess,
    TResult? Function(_getTripSeatsFailure value)? getTripSeatsFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_loading value)? loading,
    TResult Function(_getTripSeatsSuccess value)? getTripSeatsSuccess,
    TResult Function(_getTripSeatsFailure value)? getTripSeatsFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TripSeatsStateCopyWith<$Res> {
  factory $TripSeatsStateCopyWith(
          TripSeatsState value, $Res Function(TripSeatsState) then) =
      _$TripSeatsStateCopyWithImpl<$Res, TripSeatsState>;
}

/// @nodoc
class _$TripSeatsStateCopyWithImpl<$Res, $Val extends TripSeatsState>
    implements $TripSeatsStateCopyWith<$Res> {
  _$TripSeatsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$TripSeatsStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'TripSeatsState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<SeatModel> seats) getTripSeatsSuccess,
    required TResult Function(String message) getTripSeatsFailure,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<SeatModel> seats)? getTripSeatsSuccess,
    TResult? Function(String message)? getTripSeatsFailure,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<SeatModel> seats)? getTripSeatsSuccess,
    TResult Function(String message)? getTripSeatsFailure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_loading value) loading,
    required TResult Function(_getTripSeatsSuccess value) getTripSeatsSuccess,
    required TResult Function(_getTripSeatsFailure value) getTripSeatsFailure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_loading value)? loading,
    TResult? Function(_getTripSeatsSuccess value)? getTripSeatsSuccess,
    TResult? Function(_getTripSeatsFailure value)? getTripSeatsFailure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_loading value)? loading,
    TResult Function(_getTripSeatsSuccess value)? getTripSeatsSuccess,
    TResult Function(_getTripSeatsFailure value)? getTripSeatsFailure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements TripSeatsState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$loadingImplCopyWith<$Res> {
  factory _$$loadingImplCopyWith(
          _$loadingImpl value, $Res Function(_$loadingImpl) then) =
      __$$loadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$loadingImplCopyWithImpl<$Res>
    extends _$TripSeatsStateCopyWithImpl<$Res, _$loadingImpl>
    implements _$$loadingImplCopyWith<$Res> {
  __$$loadingImplCopyWithImpl(
      _$loadingImpl _value, $Res Function(_$loadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$loadingImpl implements _loading {
  const _$loadingImpl();

  @override
  String toString() {
    return 'TripSeatsState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$loadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<SeatModel> seats) getTripSeatsSuccess,
    required TResult Function(String message) getTripSeatsFailure,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<SeatModel> seats)? getTripSeatsSuccess,
    TResult? Function(String message)? getTripSeatsFailure,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<SeatModel> seats)? getTripSeatsSuccess,
    TResult Function(String message)? getTripSeatsFailure,
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
    required TResult Function(_Initial value) initial,
    required TResult Function(_loading value) loading,
    required TResult Function(_getTripSeatsSuccess value) getTripSeatsSuccess,
    required TResult Function(_getTripSeatsFailure value) getTripSeatsFailure,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_loading value)? loading,
    TResult? Function(_getTripSeatsSuccess value)? getTripSeatsSuccess,
    TResult? Function(_getTripSeatsFailure value)? getTripSeatsFailure,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_loading value)? loading,
    TResult Function(_getTripSeatsSuccess value)? getTripSeatsSuccess,
    TResult Function(_getTripSeatsFailure value)? getTripSeatsFailure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _loading implements TripSeatsState {
  const factory _loading() = _$loadingImpl;
}

/// @nodoc
abstract class _$$getTripSeatsSuccessImplCopyWith<$Res> {
  factory _$$getTripSeatsSuccessImplCopyWith(_$getTripSeatsSuccessImpl value,
          $Res Function(_$getTripSeatsSuccessImpl) then) =
      __$$getTripSeatsSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<SeatModel> seats});
}

/// @nodoc
class __$$getTripSeatsSuccessImplCopyWithImpl<$Res>
    extends _$TripSeatsStateCopyWithImpl<$Res, _$getTripSeatsSuccessImpl>
    implements _$$getTripSeatsSuccessImplCopyWith<$Res> {
  __$$getTripSeatsSuccessImplCopyWithImpl(_$getTripSeatsSuccessImpl _value,
      $Res Function(_$getTripSeatsSuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? seats = null,
  }) {
    return _then(_$getTripSeatsSuccessImpl(
      seats: null == seats
          ? _value._seats
          : seats // ignore: cast_nullable_to_non_nullable
              as List<SeatModel>,
    ));
  }
}

/// @nodoc

class _$getTripSeatsSuccessImpl implements _getTripSeatsSuccess {
  const _$getTripSeatsSuccessImpl({required final List<SeatModel> seats})
      : _seats = seats;

  final List<SeatModel> _seats;
  @override
  List<SeatModel> get seats {
    if (_seats is EqualUnmodifiableListView) return _seats;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_seats);
  }

  @override
  String toString() {
    return 'TripSeatsState.getTripSeatsSuccess(seats: $seats)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$getTripSeatsSuccessImpl &&
            const DeepCollectionEquality().equals(other._seats, _seats));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_seats));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$getTripSeatsSuccessImplCopyWith<_$getTripSeatsSuccessImpl> get copyWith =>
      __$$getTripSeatsSuccessImplCopyWithImpl<_$getTripSeatsSuccessImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<SeatModel> seats) getTripSeatsSuccess,
    required TResult Function(String message) getTripSeatsFailure,
  }) {
    return getTripSeatsSuccess(seats);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<SeatModel> seats)? getTripSeatsSuccess,
    TResult? Function(String message)? getTripSeatsFailure,
  }) {
    return getTripSeatsSuccess?.call(seats);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<SeatModel> seats)? getTripSeatsSuccess,
    TResult Function(String message)? getTripSeatsFailure,
    required TResult orElse(),
  }) {
    if (getTripSeatsSuccess != null) {
      return getTripSeatsSuccess(seats);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_loading value) loading,
    required TResult Function(_getTripSeatsSuccess value) getTripSeatsSuccess,
    required TResult Function(_getTripSeatsFailure value) getTripSeatsFailure,
  }) {
    return getTripSeatsSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_loading value)? loading,
    TResult? Function(_getTripSeatsSuccess value)? getTripSeatsSuccess,
    TResult? Function(_getTripSeatsFailure value)? getTripSeatsFailure,
  }) {
    return getTripSeatsSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_loading value)? loading,
    TResult Function(_getTripSeatsSuccess value)? getTripSeatsSuccess,
    TResult Function(_getTripSeatsFailure value)? getTripSeatsFailure,
    required TResult orElse(),
  }) {
    if (getTripSeatsSuccess != null) {
      return getTripSeatsSuccess(this);
    }
    return orElse();
  }
}

abstract class _getTripSeatsSuccess implements TripSeatsState {
  const factory _getTripSeatsSuccess({required final List<SeatModel> seats}) =
      _$getTripSeatsSuccessImpl;

  List<SeatModel> get seats;
  @JsonKey(ignore: true)
  _$$getTripSeatsSuccessImplCopyWith<_$getTripSeatsSuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$getTripSeatsFailureImplCopyWith<$Res> {
  factory _$$getTripSeatsFailureImplCopyWith(_$getTripSeatsFailureImpl value,
          $Res Function(_$getTripSeatsFailureImpl) then) =
      __$$getTripSeatsFailureImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$getTripSeatsFailureImplCopyWithImpl<$Res>
    extends _$TripSeatsStateCopyWithImpl<$Res, _$getTripSeatsFailureImpl>
    implements _$$getTripSeatsFailureImplCopyWith<$Res> {
  __$$getTripSeatsFailureImplCopyWithImpl(_$getTripSeatsFailureImpl _value,
      $Res Function(_$getTripSeatsFailureImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$getTripSeatsFailureImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$getTripSeatsFailureImpl implements _getTripSeatsFailure {
  const _$getTripSeatsFailureImpl({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'TripSeatsState.getTripSeatsFailure(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$getTripSeatsFailureImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$getTripSeatsFailureImplCopyWith<_$getTripSeatsFailureImpl> get copyWith =>
      __$$getTripSeatsFailureImplCopyWithImpl<_$getTripSeatsFailureImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<SeatModel> seats) getTripSeatsSuccess,
    required TResult Function(String message) getTripSeatsFailure,
  }) {
    return getTripSeatsFailure(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<SeatModel> seats)? getTripSeatsSuccess,
    TResult? Function(String message)? getTripSeatsFailure,
  }) {
    return getTripSeatsFailure?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<SeatModel> seats)? getTripSeatsSuccess,
    TResult Function(String message)? getTripSeatsFailure,
    required TResult orElse(),
  }) {
    if (getTripSeatsFailure != null) {
      return getTripSeatsFailure(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_loading value) loading,
    required TResult Function(_getTripSeatsSuccess value) getTripSeatsSuccess,
    required TResult Function(_getTripSeatsFailure value) getTripSeatsFailure,
  }) {
    return getTripSeatsFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_loading value)? loading,
    TResult? Function(_getTripSeatsSuccess value)? getTripSeatsSuccess,
    TResult? Function(_getTripSeatsFailure value)? getTripSeatsFailure,
  }) {
    return getTripSeatsFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_loading value)? loading,
    TResult Function(_getTripSeatsSuccess value)? getTripSeatsSuccess,
    TResult Function(_getTripSeatsFailure value)? getTripSeatsFailure,
    required TResult orElse(),
  }) {
    if (getTripSeatsFailure != null) {
      return getTripSeatsFailure(this);
    }
    return orElse();
  }
}

abstract class _getTripSeatsFailure implements TripSeatsState {
  const factory _getTripSeatsFailure({required final String message}) =
      _$getTripSeatsFailureImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$getTripSeatsFailureImplCopyWith<_$getTripSeatsFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
