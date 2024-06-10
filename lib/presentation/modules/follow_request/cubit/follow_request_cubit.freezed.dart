// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'follow_request_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FollowRequestState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<FollowRequestModel> requests)
        getNotificationSuccess,
    required TResult Function(String message) getNotificationFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<FollowRequestModel> requests)?
        getNotificationSuccess,
    TResult? Function(String message)? getNotificationFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<FollowRequestModel> requests)? getNotificationSuccess,
    TResult Function(String message)? getNotificationFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_loading value) loading,
    required TResult Function(_getNotificationSuccess value)
        getNotificationSuccess,
    required TResult Function(_getNotificationFailure value)
        getNotificationFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_loading value)? loading,
    TResult? Function(_getNotificationSuccess value)? getNotificationSuccess,
    TResult? Function(_getNotificationFailure value)? getNotificationFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_loading value)? loading,
    TResult Function(_getNotificationSuccess value)? getNotificationSuccess,
    TResult Function(_getNotificationFailure value)? getNotificationFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FollowRequestStateCopyWith<$Res> {
  factory $FollowRequestStateCopyWith(
          FollowRequestState value, $Res Function(FollowRequestState) then) =
      _$FollowRequestStateCopyWithImpl<$Res, FollowRequestState>;
}

/// @nodoc
class _$FollowRequestStateCopyWithImpl<$Res, $Val extends FollowRequestState>
    implements $FollowRequestStateCopyWith<$Res> {
  _$FollowRequestStateCopyWithImpl(this._value, this._then);

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
    extends _$FollowRequestStateCopyWithImpl<$Res, _$InitialImpl>
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
    return 'FollowRequestState.initial()';
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
    required TResult Function(List<FollowRequestModel> requests)
        getNotificationSuccess,
    required TResult Function(String message) getNotificationFailure,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<FollowRequestModel> requests)?
        getNotificationSuccess,
    TResult? Function(String message)? getNotificationFailure,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<FollowRequestModel> requests)? getNotificationSuccess,
    TResult Function(String message)? getNotificationFailure,
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
    required TResult Function(_getNotificationSuccess value)
        getNotificationSuccess,
    required TResult Function(_getNotificationFailure value)
        getNotificationFailure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_loading value)? loading,
    TResult? Function(_getNotificationSuccess value)? getNotificationSuccess,
    TResult? Function(_getNotificationFailure value)? getNotificationFailure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_loading value)? loading,
    TResult Function(_getNotificationSuccess value)? getNotificationSuccess,
    TResult Function(_getNotificationFailure value)? getNotificationFailure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements FollowRequestState {
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
    extends _$FollowRequestStateCopyWithImpl<$Res, _$loadingImpl>
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
    return 'FollowRequestState.loading()';
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
    required TResult Function(List<FollowRequestModel> requests)
        getNotificationSuccess,
    required TResult Function(String message) getNotificationFailure,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<FollowRequestModel> requests)?
        getNotificationSuccess,
    TResult? Function(String message)? getNotificationFailure,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<FollowRequestModel> requests)? getNotificationSuccess,
    TResult Function(String message)? getNotificationFailure,
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
    required TResult Function(_getNotificationSuccess value)
        getNotificationSuccess,
    required TResult Function(_getNotificationFailure value)
        getNotificationFailure,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_loading value)? loading,
    TResult? Function(_getNotificationSuccess value)? getNotificationSuccess,
    TResult? Function(_getNotificationFailure value)? getNotificationFailure,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_loading value)? loading,
    TResult Function(_getNotificationSuccess value)? getNotificationSuccess,
    TResult Function(_getNotificationFailure value)? getNotificationFailure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _loading implements FollowRequestState {
  const factory _loading() = _$loadingImpl;
}

/// @nodoc
abstract class _$$getNotificationSuccessImplCopyWith<$Res> {
  factory _$$getNotificationSuccessImplCopyWith(
          _$getNotificationSuccessImpl value,
          $Res Function(_$getNotificationSuccessImpl) then) =
      __$$getNotificationSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<FollowRequestModel> requests});
}

/// @nodoc
class __$$getNotificationSuccessImplCopyWithImpl<$Res>
    extends _$FollowRequestStateCopyWithImpl<$Res, _$getNotificationSuccessImpl>
    implements _$$getNotificationSuccessImplCopyWith<$Res> {
  __$$getNotificationSuccessImplCopyWithImpl(
      _$getNotificationSuccessImpl _value,
      $Res Function(_$getNotificationSuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? requests = null,
  }) {
    return _then(_$getNotificationSuccessImpl(
      requests: null == requests
          ? _value._requests
          : requests // ignore: cast_nullable_to_non_nullable
              as List<FollowRequestModel>,
    ));
  }
}

/// @nodoc

class _$getNotificationSuccessImpl implements _getNotificationSuccess {
  const _$getNotificationSuccessImpl(
      {required final List<FollowRequestModel> requests})
      : _requests = requests;

  final List<FollowRequestModel> _requests;
  @override
  List<FollowRequestModel> get requests {
    if (_requests is EqualUnmodifiableListView) return _requests;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_requests);
  }

  @override
  String toString() {
    return 'FollowRequestState.getNotificationSuccess(requests: $requests)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$getNotificationSuccessImpl &&
            const DeepCollectionEquality().equals(other._requests, _requests));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_requests));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$getNotificationSuccessImplCopyWith<_$getNotificationSuccessImpl>
      get copyWith => __$$getNotificationSuccessImplCopyWithImpl<
          _$getNotificationSuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<FollowRequestModel> requests)
        getNotificationSuccess,
    required TResult Function(String message) getNotificationFailure,
  }) {
    return getNotificationSuccess(requests);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<FollowRequestModel> requests)?
        getNotificationSuccess,
    TResult? Function(String message)? getNotificationFailure,
  }) {
    return getNotificationSuccess?.call(requests);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<FollowRequestModel> requests)? getNotificationSuccess,
    TResult Function(String message)? getNotificationFailure,
    required TResult orElse(),
  }) {
    if (getNotificationSuccess != null) {
      return getNotificationSuccess(requests);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_loading value) loading,
    required TResult Function(_getNotificationSuccess value)
        getNotificationSuccess,
    required TResult Function(_getNotificationFailure value)
        getNotificationFailure,
  }) {
    return getNotificationSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_loading value)? loading,
    TResult? Function(_getNotificationSuccess value)? getNotificationSuccess,
    TResult? Function(_getNotificationFailure value)? getNotificationFailure,
  }) {
    return getNotificationSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_loading value)? loading,
    TResult Function(_getNotificationSuccess value)? getNotificationSuccess,
    TResult Function(_getNotificationFailure value)? getNotificationFailure,
    required TResult orElse(),
  }) {
    if (getNotificationSuccess != null) {
      return getNotificationSuccess(this);
    }
    return orElse();
  }
}

abstract class _getNotificationSuccess implements FollowRequestState {
  const factory _getNotificationSuccess(
          {required final List<FollowRequestModel> requests}) =
      _$getNotificationSuccessImpl;

  List<FollowRequestModel> get requests;
  @JsonKey(ignore: true)
  _$$getNotificationSuccessImplCopyWith<_$getNotificationSuccessImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$getNotificationFailureImplCopyWith<$Res> {
  factory _$$getNotificationFailureImplCopyWith(
          _$getNotificationFailureImpl value,
          $Res Function(_$getNotificationFailureImpl) then) =
      __$$getNotificationFailureImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$getNotificationFailureImplCopyWithImpl<$Res>
    extends _$FollowRequestStateCopyWithImpl<$Res, _$getNotificationFailureImpl>
    implements _$$getNotificationFailureImplCopyWith<$Res> {
  __$$getNotificationFailureImplCopyWithImpl(
      _$getNotificationFailureImpl _value,
      $Res Function(_$getNotificationFailureImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$getNotificationFailureImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$getNotificationFailureImpl implements _getNotificationFailure {
  const _$getNotificationFailureImpl({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'FollowRequestState.getNotificationFailure(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$getNotificationFailureImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$getNotificationFailureImplCopyWith<_$getNotificationFailureImpl>
      get copyWith => __$$getNotificationFailureImplCopyWithImpl<
          _$getNotificationFailureImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<FollowRequestModel> requests)
        getNotificationSuccess,
    required TResult Function(String message) getNotificationFailure,
  }) {
    return getNotificationFailure(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<FollowRequestModel> requests)?
        getNotificationSuccess,
    TResult? Function(String message)? getNotificationFailure,
  }) {
    return getNotificationFailure?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<FollowRequestModel> requests)? getNotificationSuccess,
    TResult Function(String message)? getNotificationFailure,
    required TResult orElse(),
  }) {
    if (getNotificationFailure != null) {
      return getNotificationFailure(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_loading value) loading,
    required TResult Function(_getNotificationSuccess value)
        getNotificationSuccess,
    required TResult Function(_getNotificationFailure value)
        getNotificationFailure,
  }) {
    return getNotificationFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_loading value)? loading,
    TResult? Function(_getNotificationSuccess value)? getNotificationSuccess,
    TResult? Function(_getNotificationFailure value)? getNotificationFailure,
  }) {
    return getNotificationFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_loading value)? loading,
    TResult Function(_getNotificationSuccess value)? getNotificationSuccess,
    TResult Function(_getNotificationFailure value)? getNotificationFailure,
    required TResult orElse(),
  }) {
    if (getNotificationFailure != null) {
      return getNotificationFailure(this);
    }
    return orElse();
  }
}

abstract class _getNotificationFailure implements FollowRequestState {
  const factory _getNotificationFailure({required final String message}) =
      _$getNotificationFailureImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$getNotificationFailureImplCopyWith<_$getNotificationFailureImpl>
      get copyWith => throw _privateConstructorUsedError;
}
