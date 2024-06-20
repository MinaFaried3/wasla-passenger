// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$NotificationState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<NotificationModel> notifications)
        getNotificationSuccess,
    required TResult Function(String message) getNotificationFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<NotificationModel> notifications)?
        getNotificationSuccess,
    TResult? Function(String message)? getNotificationFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<NotificationModel> notifications)?
        getNotificationSuccess,
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
abstract class $NotificationStateCopyWith<$Res> {
  factory $NotificationStateCopyWith(
          NotificationState value, $Res Function(NotificationState) then) =
      _$NotificationStateCopyWithImpl<$Res, NotificationState>;
}

/// @nodoc
class _$NotificationStateCopyWithImpl<$Res, $Val extends NotificationState>
    implements $NotificationStateCopyWith<$Res> {
  _$NotificationStateCopyWithImpl(this._value, this._then);

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
    extends _$NotificationStateCopyWithImpl<$Res, _$InitialImpl>
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
    return 'NotificationState.initial()';
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
    required TResult Function(List<NotificationModel> notifications)
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
    TResult? Function(List<NotificationModel> notifications)?
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
    TResult Function(List<NotificationModel> notifications)?
        getNotificationSuccess,
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

abstract class _Initial implements NotificationState {
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
    extends _$NotificationStateCopyWithImpl<$Res, _$loadingImpl>
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
    return 'NotificationState.loading()';
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
    required TResult Function(List<NotificationModel> notifications)
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
    TResult? Function(List<NotificationModel> notifications)?
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
    TResult Function(List<NotificationModel> notifications)?
        getNotificationSuccess,
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

abstract class _loading implements NotificationState {
  const factory _loading() = _$loadingImpl;
}

/// @nodoc
abstract class _$$getNotificationSuccessImplCopyWith<$Res> {
  factory _$$getNotificationSuccessImplCopyWith(
          _$getNotificationSuccessImpl value,
          $Res Function(_$getNotificationSuccessImpl) then) =
      __$$getNotificationSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<NotificationModel> notifications});
}

/// @nodoc
class __$$getNotificationSuccessImplCopyWithImpl<$Res>
    extends _$NotificationStateCopyWithImpl<$Res, _$getNotificationSuccessImpl>
    implements _$$getNotificationSuccessImplCopyWith<$Res> {
  __$$getNotificationSuccessImplCopyWithImpl(
      _$getNotificationSuccessImpl _value,
      $Res Function(_$getNotificationSuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? notifications = null,
  }) {
    return _then(_$getNotificationSuccessImpl(
      notifications: null == notifications
          ? _value._notifications
          : notifications // ignore: cast_nullable_to_non_nullable
              as List<NotificationModel>,
    ));
  }
}

/// @nodoc

class _$getNotificationSuccessImpl implements _getNotificationSuccess {
  const _$getNotificationSuccessImpl(
      {required final List<NotificationModel> notifications})
      : _notifications = notifications;

  final List<NotificationModel> _notifications;
  @override
  List<NotificationModel> get notifications {
    if (_notifications is EqualUnmodifiableListView) return _notifications;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_notifications);
  }

  @override
  String toString() {
    return 'NotificationState.getNotificationSuccess(notifications: $notifications)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$getNotificationSuccessImpl &&
            const DeepCollectionEquality()
                .equals(other._notifications, _notifications));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_notifications));

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
    required TResult Function(List<NotificationModel> notifications)
        getNotificationSuccess,
    required TResult Function(String message) getNotificationFailure,
  }) {
    return getNotificationSuccess(notifications);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<NotificationModel> notifications)?
        getNotificationSuccess,
    TResult? Function(String message)? getNotificationFailure,
  }) {
    return getNotificationSuccess?.call(notifications);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<NotificationModel> notifications)?
        getNotificationSuccess,
    TResult Function(String message)? getNotificationFailure,
    required TResult orElse(),
  }) {
    if (getNotificationSuccess != null) {
      return getNotificationSuccess(notifications);
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

abstract class _getNotificationSuccess implements NotificationState {
  const factory _getNotificationSuccess(
          {required final List<NotificationModel> notifications}) =
      _$getNotificationSuccessImpl;

  List<NotificationModel> get notifications;
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
    extends _$NotificationStateCopyWithImpl<$Res, _$getNotificationFailureImpl>
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
    return 'NotificationState.getNotificationFailure(message: $message)';
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
    required TResult Function(List<NotificationModel> notifications)
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
    TResult? Function(List<NotificationModel> notifications)?
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
    TResult Function(List<NotificationModel> notifications)?
        getNotificationSuccess,
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

abstract class _getNotificationFailure implements NotificationState {
  const factory _getNotificationFailure({required final String message}) =
      _$getNotificationFailureImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$getNotificationFailureImplCopyWith<_$getNotificationFailureImpl>
      get copyWith => throw _privateConstructorUsedError;
}
